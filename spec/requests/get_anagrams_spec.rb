require 'rails_helper'

describe 'Get Anagrams API' do
  describe 'GET /anagrams/:word.json' do
    it 'Returns a JSON array of words that are anagrams of the word passed in' do
      ana = AnagramCreator.new(['read', 'dear', 'dare'])
      ana.log_anagrams

      get '/anagrams/dear.json'

      anagrams = JSON.parse(response.body)['anagrams']

      expect(response.status).to eq(200)
      expect(anagrams).to be_an(Array)
      expect(anagrams.count).to eq(2)
      expect(anagrams.first).to eq('dare')
      expect(anagrams.last).to eq('read')
    end
  end
  describe 'GET /anagrams/:word.json?limit=1' do
    it 'Returns a JSON array of words that are anagrams of the word passed in with an optional limit paameter' do
      ana = AnagramCreator.new(['read', 'dear', 'dare'])
      ana.log_anagrams

      get '/anagrams/dear.json?limit=1'

      anagrams = JSON.parse(response.body)['anagrams']

      expect(response.status).to eq(200)
      expect(anagrams).to be_an(Array)
      expect(anagrams.count).to eq(1)
      expect(anagrams.first).to eq('dare')
    end
  end
end
