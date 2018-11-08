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

  describe 'callback' do
    it 'should be deleted after its last word is deleted' do
      anagram = Anagram.create(sorted_spelling: 'act')
      anagram.words.create(spelling: 'act')
      anagram.words.create(spelling: 'cat')

      expect(Anagram.count).to eq(1)

      Word.destroy(2)
      Word.destroy(1)

      expect(Anagram.count).to eq(0)
    end
  end
end
