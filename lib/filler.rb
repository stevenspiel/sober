require_relative 'words/words.rb'
require_relative 'logic/short_clauses'
require_relative 'logic/medium_clauses'
require_relative 'logic/long_clauses'
require_relative 'logic/punctuated_clauses'

module Filler
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

  def self.sentence(type = :medium)
    extend ShortClauses
    return sentencefy(Filler.short_clauses.first) if type == :short

    extend MediumClauses
    return sentencefy(Filler.medium_clauses.first) if type == :medium

    extend LongClauses
    return sentencefy(Filler.long_clauses.sample) if type == :long

    extend PunctuatedClauses

    #for paragraphs and n number of sentences
    if type.is_a?(Fixnum)
      n = type
      paragraph_array = [Filler.short_clauses,Filler.medium_clauses,Filler.punctuated_clauses,Filler.long_clauses].flatten(1).sample(n)
      return paragraph_array.map {|sentence_array| sentencefy(sentence_array)}.join(" ")
    end
  end

  def self.sentences(n = 3)
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

  def self.paragraphs(n = 3)
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
