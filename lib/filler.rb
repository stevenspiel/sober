require_relative 'words/words.rb'

class Filler
  def self.n; NOUNS.sample; end
  def self.v; VERBS.sample; end
  def self.a; ADJECTIVES.sample; end
  def self.pp; PREPOSITIONS.sample; end
  def self.ad; ADVERBS.sample; end
  def self.pr; PRONOUNS.sample; end
  def self.c; CONJUNCTIONS.sample; end
  def self.pn; PROPER_NOUNS.sample; end
  def self.pcn; PUNCTUATION.sample; end

  def self.sentence
    # clause =
    sentence_sample = [self.n,self.a,self.c,self.pn,self.a,self.pp,self.n,self.v,self.c,self.a,self.v]
    sentencified = sentence_sample.join(" ") + self.pcn
  end

  class Name
    def self.first_name
      FIRST_NAMES.sample
    end

    def self.last_name
      LAST_NAMES.sample
    end

    def self.name
      "#{self.first_name} #{self.last_name}"
    end
  end

  class Dictionary
    def self.word
    end
  end

end
