require_relative 'spec_helper'

describe TextEng::Gender do
  let(:one_letter_genders){['m','f']}
  let(:full_name_genders){['male','female']}

  describe '#random' do
    it "should generate a string" do
      expect(TextEng::Gender.random).to be_a_kind_of(String)
    end

    it "should genderate a full gender by default" do

    end

    it "should generate a single-letter gender when passed parameter" do

    end

    it "should produce a random gender" do

    end
  end

end
