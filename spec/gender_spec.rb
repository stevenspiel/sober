require_relative 'spec_helper'
require_relative '../lib/text_eng/gender'

describe TextEng::Gender do
  let(:gender){TextEng::Gender.random}

  describe '#random' do
    it "should generate a string" do
      expect(gender).to be_a_kind_of(String)
    end

    it "should genderate a full gender by default" do
      expect(gender.size).to be > 1 
    end

    it "should generate a single-letter gender when passed parameter" do
      expect(GENDER_SHORT.include?(TextEng::Gender.random one_letter: true)).to eq(true)
    end

    it "should produce a random gender" do
      genders = []
      20.times {genders << TextEng::Gender.random}
      expect(genders.uniq.size).to be > 1
    end
  end

  describe '#smart' do
    it "should produce a male gender when passed a male name" do
      male_name = TextEng::Name.first_name(:male)
      expect(TextEng::Gender.smart(male_name))
    end

    it "should produce a female gender when passed a female name" do
      female_name = TextEng::Name.first_name(:female)
      expect(TextEng::Gender.smart(female_name))
    end
  end

end
