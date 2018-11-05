require 'rails_helper'

describe 'POST Words API' do
  describe 'POST /words.json' do
    it 'Adds words to the data store from JSON' do
      ana = AnagramCreator.new(['dog', 'tile', 'floor'])
      ana.log_anagrams

      expect(Anagram.count).to eq(3)
      expect(Word.count).to eq(3)

      json_payload = ({ "words": ["read", "dear", "dare"] }).to_json
      post '/words.json', params: json_payload

      expect(response.status).to eq(201)
      expect(Anagram.count).to eq(4)
      expect(Word.count).to eq(6)
    end
  end
end
