require 'rails_helper'

describe 'DELETE All Words API' do
  describe 'DELETE /words.json' do
    it 'Deletes all words and anagram keys from the data store' do
      ana = AnagramCreator.new(['dog', 'tile', 'floor', 'lite'])
      ana.log_anagrams

      expect(Word.count).to eq(4)
      expect(Anagram.count).to eq(3)

      delete '/words.json'

      expect(response.status).to eq(204)
      expect(Word.count).to eq(0)
      expect(Anagram.count).to eq(0)
    end
  end
end
