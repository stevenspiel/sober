require_relative 'spec_helper'
require_relative '../lib/sober/gender'

describe Sober::Gender do
  let(:gender){Sober::Gender.random}

  describe '#random' do
    it 'should generate a string' do
      expect(gender).to be_a_kind_of(String)
    end

    it 'should genderate a full gender by default' do
      expect(gender.size).to be > 1
    end

    it 'should generate a single-letter gender when passed parameter' do
      expect(GENDER_SHORT.include?(Sober::Gender.random one_letter: true)).to eq(true)
    end

    it 'should produce a random gender' do
      genders = []
      20.times {genders << Sober::Gender.random}
      expect(genders.uniq.size).to be > 1
    end
  end

  describe '#smart' do
    let(:male_name){Sober::Name.first_name(:male)}
    let(:female_name){Sober::Name.first_name(:female)}

    it 'should produce a male gender when passed a male name' do
      expect(Sober::Gender.smart(male_name)).to eq('male')
    end

    it 'should produce a female gender when passed a female name' do
      expect(Sober::Gender.smart(female_name)).to eq('female')
    end

    it 'should give a one-letter gender when passed parameter' do
      expect(Sober::Gender.smart(male_name, one_letter: true)).to eq('m')
    end

    it 'should raise error if name is not recognized' do
      expect{Sober::Gender.smart('sdgoaisdg')}.to raise_error(NameNotRecognizedError)
    end
  end

end
