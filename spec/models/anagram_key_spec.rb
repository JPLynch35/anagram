require 'rails_helper'

describe AnagramKey, type: :model do
  it 'exists' do
    anagram_key = AnagramKey.create(sorted_spelling: 'enop')

    expect(anagram_key).to be_an(AnagramKey)
  end

  describe 'validations' do
    it { should validate_presence_of(:sorted_spelling) }
  end

  describe 'relationships' do
    it { should have_many(:words) }
  end
end
