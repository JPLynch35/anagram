require 'rails_helper'

describe 'GET Anagrams API' do
  describe 'GET /anagrams/:word.json' do
    it 'Returns a JSON array of words that are anagrams of the word passed in' do
      anagrams = AnagramCreator.new(['read', 'dear', 'dare'])
      anagrams.log_anagrams

      get '/anagrams/dear.json'
      all_anagrams = JSON.parse(response.body)['anagrams']

      expect(response.status).to eq(200)
      expect(all_anagrams).to be_an(Array)
      expect(all_anagrams.count).to eq(2)
      expect(all_anagrams.first).to eq('dare')
      expect(all_anagrams.last).to eq('read')
    end
    it 'Returns a an empty JSON array if there are no anagrams for the word' do
      get '/anagrams/dear.json'

      all_anagrams = JSON.parse(response.body)['anagrams']

      expect(response.status).to eq(200)
      expect(all_anagrams).to be_an(Array)
      expect(all_anagrams.count).to eq(0)
    end
  end
  describe 'GET /anagrams/:word.json?limit=1' do
    it 'Returns a JSON array of words that are anagrams of the word passed in with an optional limit parameter' do
      anagrams = AnagramCreator.new(['read', 'dear', 'dare'])
      anagrams.log_anagrams

      get '/anagrams/dear.json?limit=1'

      all_anagrams = JSON.parse(response.body)['anagrams']

      expect(response.status).to eq(200)
      expect(all_anagrams).to be_an(Array)
      expect(all_anagrams.count).to eq(1)
      expect(all_anagrams.first).to eq('dare')
    end
  end
end
