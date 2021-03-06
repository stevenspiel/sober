require_relative 'words/words.rb'
require_relative 'logic/short_clauses'
require_relative 'logic/medium_clauses'
require_relative 'logic/long_clauses'
require_relative 'logic/punctuated_clauses'

module Sober
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
    #case when
    extend ShortClauses
    return sentencify(self.short_clauses.first) if type == :short

    extend MediumClauses
    return sentencify(self.medium_clauses.first) if type == :medium

    extend LongClauses
    return sentencify(self.long_clauses.sample) if type == :long

    extend PunctuatedClauses

    #for paragraphs and n number of sentences
    if type.is_a?(Fixnum)
      n = type
      paragraph_array = [self.short_clauses,self.medium_clauses,self.punctuated_clauses,self.long_clauses].flatten(1).sample(n)
      return paragraph_array.map {|sentence_array| sentencify(sentence_array)}.join(' ')
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

  def self.sentencify(sentence_array)
    sentencified = sentence_array.join(' ') + '.'
    sentencified[0] = sentencified[0].capitalize
    sentencified
  end
end

require_relative 'sober/name.rb'
