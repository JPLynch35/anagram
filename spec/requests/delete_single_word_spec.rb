require 'rails_helper'

describe 'DELETE Single Word API' do
  describe 'DELETE /words/:word.json' do
    it 'Deletes single word from the data store' do
      anagrams = AnagramCreator.new(['dog', 'tile', 'floor', 'lite'])
      anagrams.log_anagrams

      expect(Word.count).to eq(4)
      expect(Anagram.count).to eq(3)

      delete '/words/tile.json'

      expect(response.status).to eq(204)
      expect(Word.count).to eq(3)
      expect(Word.pluck(:spelling)).to eq(['dog', 'floor', 'lite'])
      expect(Anagram.count).to eq(3)
    end
  end
end
