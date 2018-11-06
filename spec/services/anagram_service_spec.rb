require 'rails_helper'

describe AnagramService do
  it 'exists' do
    anagram_service = AnagramService.new('tank')

    expect(anagram_service).to be_an(AnagramService)
  end

  it 'can retrieve all anagrams with no limit' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath'])
    anagram_creator.log_anagrams
    anagram_service = AnagramService.new('lite')

    expect(anagram_service.retrieve_anagrams).to eq([Word.first])
  end

  it 'can retrieve all anagrams with a limit' do
    anagram_creator = AnagramCreator.new(['acts', 'cats', 'dog', 'bath', 'tacs'])
    anagram_creator.log_anagrams
    anagram_service = AnagramService.new('cats', '1')

    expect(anagram_service.retrieve_anagrams).to eq([Word.first])
  end
end
