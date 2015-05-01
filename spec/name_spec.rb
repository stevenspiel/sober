require_relative 'spec_helper'

describe Sober::Name do
  let(:first_name){Sober::Name.first_name}
  let(:last_name){Sober::Name.last_name}
  let(:full_name){Sober::Name.name}

  describe '#first_name' do
    it 'should return a capitalized names' do
      expect(first_name[0]).to eq(first_name[0].upcase)
    end

    it 'should return a gender-specific name when passed a gender parameter' do
      expect(FIRST_NAMES_M.include?(Sober::Name.first_name(:male))).to eq(true)
      expect(FIRST_NAMES_F.include?(Sober::Name.first_name(:female))).to eq(true)
    end
  end

  describe '#last_name' do
    it 'should return a capitalized names' do
      expect(last_name[0]).to eq(last_name[0].upcase)
    end
  end

  describe '#name' do
    it 'should return two names' do
      expect(full_name.scan(/[A-Z]/).size).to eq(2)
    end

    it 'should return only one space in the middle' do
      expect(full_name.scan(/\w\s\w/).size).to eq(1)
    end
  end
end
