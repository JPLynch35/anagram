require 'rails_helper'

describe Anagram, type: :model do
  it 'exists' do
    anagram = Anagram.create(sorted_spelling: 'enop')

    expect(anagram).to be_an(Anagram)
  end

  describe 'validations' do
    it { should validate_presence_of(:sorted_spelling) }
  end

  describe 'relationships' do
    it { should have_many(:words) }
  end
end
