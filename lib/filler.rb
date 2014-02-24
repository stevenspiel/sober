require_relative 'words/words.rb'

class Filler
  def self.random_noun
    NOUNS.sample
  end

  def self.random_verb
    VERBS.sample
  end

  def self.random_adjective
    ADJECTIVES.sample
  end

  def self.random_proposition
    PREPOSITIONS.sample
  end

  def self.random_adverb
    ADVERBS.sample
  end

  def self.random_pronoun
    PRONOUNS.sample
  end

  def self.random_conjunctions
    CONJUNCTIONS.sample
  end

  def self.proper_noun
    PROPER_NOUNS.sample
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
    def self.random_word
    end
  end

end
