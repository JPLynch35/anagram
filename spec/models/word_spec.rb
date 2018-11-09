require 'rails_helper'

describe Word, type: :model do
  it 'exists' do
    anagram = Anagram.create(sorted_spelling: 'enop')
    word = anagram.words.create(spelling: 'open')

    expect(word).to be_an(Word)
  end

  describe 'validations' do
    it { should validate_presence_of(:spelling) }
    it { should validate_presence_of(:anagram_id) }
    it { should validate_uniqueness_of(:spelling) }
  end

  describe 'relationships' do
    it { should belong_to(:anagram) }
  end
end
