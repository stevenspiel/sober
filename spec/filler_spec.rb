require_relative 'spec_helper'

describe Filler do
  let(:default_sentence){Filler.sentence}

  describe '#sentencefy' do
    let(:string){"this is a sentence"}

    it "returns a capitalized first letter" do
      expect(default_sentence[0]).to eq(default_sentence[0].upcase)
    end

    it "ends with a period" do
      expect(default_sentence[-1]).to eq('.')
    end
  end

  describe '#sentence' do
    let(:short_sentence){Filler.sentence(:short)}
    let(:medium_sentence){Filler.sentence(:medium)}
    let(:long_sentence){Filler.sentence(:long)}

    it "returns a string" do
      expect(medium_sentence).to be_a_kind_of(String)
    end

    it "returns exactly one sentence (only one period)" do #TODO: fix that this test requires that there are no periods in words (e.g. 'Mt. Rushmore')
      expect(medium_sentence.count(".")).to eq(1)
    end

    it "generates :long sentences longer than :short sentences" do
      expect(long_sentence.size).to be > (short_sentence.size)
    end

    it "defaults to creating medium-sized sentences" do
      expect(default_sentence.size).to be < (long_sentence.size)
    end
  end

  describe '#sentences(n)' do
    it "returns the number of sentences (periods) defined in the argument" do
      expect(Filler.sentences(2).count(".")).to eq(2)
      expect(Filler.sentences(5).count(".")).to eq(5)
    end
  end

  describe '#paragraph' do
    let(:default_paragraph){Filler.paragraph}
    let(:short_paragraph){Filler.paragraph(:short)}
    let(:medium_paragraph){Filler.paragraph(:medium)}
    let(:long_paragraph){Filler.paragraph(:long)}

    it "returns more than one sentence" do
      expect(default_paragraph.count(".")).to be > 1
    end

    it "returns between 2 and 4 sentences for a short paragraph" do
      expect(short_paragraph.count(".")).to be >= 2
      expect(short_paragraph.count(".")).to be <= 4
    end

    it "returns between 5 and 9 sentences for a medium paragraph" do
      expect(medium_paragraph.count(".")).to be >= 5
      expect(medium_paragraph.count(".")).to be <= 9
    end

    it "returns between 5 and 9 sentences for a default (medium) paragraph" do
      expect(default_paragraph.count(".")).to be >= 5
      expect(default_paragraph.count(".")).to be <= 9
    end

    it "returns between 10 and 15 sentences for a long paragraph" do
      expect(long_paragraph.count(".")).to be >= 10
      expect(long_paragraph.count(".")).to be <= 15
    end
  end

  describe '#paragraphs(n)' do
    it "separates paragraphs with a blank line" do
      expect(Filler.paragraphs.match(/\n\n/)).to be_true
    end

    it "returns more than one paragraph" do
      expect(Filler.paragraphs.scan(/\n\n/).size).to be >= 1
    end

    it "defualts to generating 3 paragraphs" do
      expect(Filler.paragraphs.scan(/\n\n/).size).to be == 2
    end

    it "returns the number of paragraphs in the argument" do
      expect(Filler.paragraphs(10).scan(/\n\n/).size).to be == 9
    end
  end

end
