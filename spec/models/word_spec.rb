require 'rails_helper'

describe Word, type: :model do
  it 'exists' do
    anagram_key = AnagramKey.create(sorted_spelling: 'enop')
    word = anagram_key.words.create(spelling: 'open')

    expect(word).to be_an(Word)
  end

  describe 'validations' do
    it { should validate_presence_of(:spelling) }
    it { should validate_presence_of(:anagram_key_id) }
  end

  describe 'relationships' do
    it { should belong_to(:anagram_key) }
  end
end
