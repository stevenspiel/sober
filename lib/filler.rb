require_relative 'words/words.rb'

class Filler
  def self.n; NOUNS.sample; end
  def self.pn; PROPER_NOUNS.sample; end
  def self.v; VERBS.sample; end
  def self.lv; LONG_VERBS.sample; end
  def self.a; ADJECTIVES.sample; end
  def self.ad; ADVERBS.sample; end
  def self.ar; ARTICLES.sample; end
  def self.pp; PREPOSITIONS.sample; end
  def self.pr; PRONOUNS.sample; end
  def self.c; CONJUNCTIONS.sample; end
  def self.pcn; PUNCTUATION.sample; end

  def self.sentence(type = :medium, paragraph_length = nil)
    short_clauses = [
      [self.lv,self.n,self.v,self.ad,self.ar,self.n],
      [self.pp,self.ar,self.ad,self.n,self.lv,self.n],
      [self.pp,self.n,self.n,self.lv,self.n],
      [self.n,self.v,self.c,self.n,self.v],
      [self.n,self.v,self.ar,self.n],
      [self.n,self.lv,self.ar,self.n],
    ].shuffle
    return sentencefy(short_clauses.first) if type == :short

    medium_clauses = [
      [self.pp,self.pr,self.ad,self.ad,self.n,self.ar,self.pn,self.v,self.a],
      [self.pn,self.pp,self.n,self.pp,self.ar,self.ad,self.ad,self.n],
      [self.pr,self.ad,self.lv,self.c,self.a,self.ar,self.n],
      [self.lv,self.n,self.v,self.ad,self.ar,self.ar,self.n],
      [self.v,self.ad,self.n,self.pp,self.ar,self.n,self.v],
      [self.ar,self.n,self.lv,self.ad,self.a,self.n],
    ].shuffle
    return sentencefy(medium_clauses.first) if type == :medium

    long_clauses = [
      [self.n,self.a,self.c,self.n,self.v,self.a,self.pp,self.n,self.v,self.c,self.n,self.v,self.n],
      short_clauses[0] + short_clauses[1],
      short_clauses[2] + short_clauses[3],
      short_clauses[4] + short_clauses[5],
      medium_clauses[0] + medium_clauses[1],
      medium_clauses[2] + medium_clauses[3],
      medium_clauses[4] + short_clauses[5]
    ]
    return sentencefy(long_clauses.sample) if type == :long

    punctuated_clauses = [
      [short_clauses.sample[0..-1] + [self.n + self.pcn] + short_clauses.sample],
      [medium_clauses.sample[0..-1] + [self.n + self.pcn] + short_clauses.sample]
    ]

    #for paragraphs and n number of sentences
    if type.is_a?(Fixnum)
      n = type
      paragraph_array = [short_clauses,medium_clauses,punctuated_clauses,long_clauses].flatten(1).sample(n)
      return paragraph_array.map {|sentence_array| sentencefy(sentence_array)}.join(" ")
    end

    #randomly lengthed sentence (defualt)
    sentence_array =[short_clauses,medium_clauses,punctuated_clauses,long_clauses].sample.sample
    return self.sentencefy(sentence_array)
  end

  def self.sentences(n)
    self.sentence(n)
  end

  def self.paragraph(type = :medium)
    if type == :short
      n = rand(2..4)
    elsif type == :long
      n = rand(10..15)
    else
      n = rand(5..9)
    end
    self.sentences(n)
  end

  def self.paragraphs(n)
    block = []
    n.times { block << self.paragraph }
    block.join("\n\n")
  end 

  private

  def self.sentencefy(sentence_array)
    sentencified = sentence_array.join(" ") + '.'
    sentencified[0] = sentencified[0].capitalize
    sentencified
  end
end


require_relative 'name.rb'