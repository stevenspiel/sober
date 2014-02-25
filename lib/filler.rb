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
      [self.n,self.lv,self.n],
    ].shuffle
    return sentencefy(short_clauses.sample) if type == :short

    medium_clauses = [
      [self.pp,self.pr,self.ad,self.ad,self.n,self.ar,self.pn,self.v,self.a],
      [self.pn,self.pp,self.n,self.pp,self.ar,self.ad,self.ad,self.n],
      [self.pr,self.ad,self.lv,self.c,self.a,self.ar,self.n],
      [self.lv,self.n,self.v,self.ad,self.ar,self.ar,self.n],
      [self.v,self.ad,self.n,self.pp,self.ar,self.n,self.v],
      [self.ar,self.n,self.lv,self.ad,self.a,self.n],
    ].shuffle
    return sentencefy(medium_clauses.sample) if type == :medium

    long_clauses = [
      [self.n,self.a,self.c,self.n,self.v,self.a,self.pp,self.n,self.v,self.c,self.n,self.v,self.n],
      [short_clauses][0,1],
      # [short_clauses][2,3], #for some reason it breaks here. Don't know why...
      # [short_clauses][4,5],
      # [medium_clauses][1,2],
      # [medium_clauses][3,4],
      # [medium_clauses][5,4],
    ]
    return sentencefy(long_clauses.sample) if type == :long

    punctuated_clauses = [
      [short_clauses.sample[0..-1] + [self.n + self.pcn] + short_clauses.sample],
      [medium_clauses.sample[0..-1] + [self.n + self.pcn] + short_clauses.sample]
    ]

    if type == :paragraph
      if paragraph_length == :short
        n_sentences = rand(2..4)
      elsif paragraph_length == :long
        n_sentences = rand(10..15)
      else
        n_sentences = rand(5..9)
      end
      paragraph_array = [short_clauses,medium_clauses,punctuated_clauses,long_clauses].flatten(1).sample(n_sentences)
      return paragraph_array.map {|sentence_array| sentencefy(sentence_array)}#.join(" ")
    end

    sentence_array =[short_clauses,medium_clauses,punctuated_clauses,long_clauses].sample.sample
    return self.sentencefy(sentence_array)
  end

  def self.sentencefy(sentence_array)
    sentencified = sentence_array.join(" ") + '.'
    sentencified[0] = sentencified[0].capitalize
    sentencified
  end

  def self.paragraph(type = :medium)
    self.sentence(:paragraph, type)
  end

end


require_relative 'name.rb'

p Filler.sentence(:long)
# p Filler.paragraph(:long)