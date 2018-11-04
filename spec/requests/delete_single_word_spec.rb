require 'rails_helper'

describe 'DELETE Single Word API' do
  describe 'DELETE /words/:word.json' do
    it 'Deletes single word from the data store' do
      ana = AnagramCreator.new(['dog', 'tile', 'floor', 'lite'])
      ana.log_anagrams

      expect(Word.count).to eq(4)
      expect(AnagramKey.count).to eq(3)

      delete '/words/tile.json'

      expect(response.status).to eq(204)
      expect(Word.count).to eq(3)
      expect(Word.pluck(:spelling)).to eq(['dog', 'floor', 'lite'])
      expect(AnagramKey.count).to eq(3)

      delete '/words/lite.json'

      expect(AnagramKey.count).to eq(2)
    end
  end
end