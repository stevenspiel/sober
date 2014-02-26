require_relative 'spec_helper'

describe "All Word Type Arrays" do
  let(:all_words){[ADJECTIVES,NOUNS,VERBS,LONG_VERBS,PASSIVE_VERBS,ARTICLES,PREPOSITIONS,
                   ADVERBS,PRONOUNS,CONJUNCTIONS,PROPER_NOUNS,FIRST_NAMES,LAST_NAMES,
                   PUNCTUATION].flatten}

  it "has no more than one space in between words" do
    expect(all_words.select{|w| w.match(/\s{2,}/)}).to eq([])
  end

  it "has no trailing spaces" do
    expect(all_words.select{|w| w.match(/[a-zA-z]\s+$/)}).to eq([])
  end

  it "has no spaces before a word" do
    expect(all_words.select{|w| w.match(/^\s+[a-zA-z]/)}).to eq([])
  end

  it "has no periods within the words" do
    expect(all_words.select{|w| w.include?(".")}).to eq([])
  end
end
