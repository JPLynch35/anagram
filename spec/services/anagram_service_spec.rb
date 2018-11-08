require 'rails_helper'

describe AnagramService do
  it 'exists' do
    anagram_service = AnagramService.new('tank')

    expect(anagram_service).to be_an(AnagramService)
  end

  it 'creates an angram object and word object if neither are found' do
    anagram_service = AnagramService.new('tile')
    
    expect(Anagram.count).to eq(0)
    expect(Word.count).to eq(0)

    anagram_service.create_anagram_and_word

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)
  end

  it 'does not create an angram object if anagram found' do
    anagram_service = AnagramService.new('tile')
    anagram_service.create_anagram_and_word

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)

    anagram_service = AnagramService.new('lite')
    anagram_service.create_anagram_and_word

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(2)
  end

  it 'does not create an angram object or word object if both found' do
    anagram_service = AnagramService.new('tile')
    anagram_service.create_anagram_and_word

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)

    anagram_service = AnagramService.new('tile')
    anagram_service.create_anagram_and_word

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)
  end

  it 'can retrieve all sorted anagrams through retrieve anagram words' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath'])
    anagram_creator.log_anagrams
    anagram_service = AnagramService.new('lite')
    anagram_words = anagram_service.retrieve_anagram_words

    expect(anagram_words).to eq([Word.second.spelling, Word.first.spelling])
  end

  it 'can return an empty array if anagram is not found' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath'])
    anagram_creator.log_anagrams
    anagram_service = AnagramService.new('burger')
    anagram_words = anagram_service.retrieve_anagram_words

    expect(anagram_words).to eq([])
  end
end
