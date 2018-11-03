require 'rails_helper'

describe 'Post Words API' do
  describe 'POST /words.json' do
    it 'Adds words to the data store from JSON' do
      ana1 = AnagramCreator.new('dog')
      ana1.log_anagram
      ana2 = AnagramCreator.new('tile')
      ana2.log_anagram
      ana3 = AnagramCreator.new('floor')
      ana3.log_anagram

      expect(AnagramKey.count).to eq(3)
      expect(Word.count).to eq(3)

      json_payload = { "words": ["read", "dear", "dare"] }.to_json
      post '/api/v1/invoice_items/random', params: json_payload

      expect(AnagramKey.count).to eq(4)
      expect(Word.count).to eq(6)
      expect(response.status).to eq(201)
    end
  end
end
