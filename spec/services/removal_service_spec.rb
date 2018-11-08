require 'rails_helper'

describe RemovalService do
  it 'exists with parameter' do
    removal_service = RemovalService.new('tank')

    expect(removal_service).to be_an(RemovalService)
  end
  
  it 'exists without parameter' do
    removal_service = RemovalService.new

    expect(removal_service).to be_an(RemovalService)
  end

  it 'can remove a single word from the database' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath'])
    anagram_creator.log_anagrams
    
    expect(Anagram.count).to eq(3)
    expect(Word.count).to eq(4)

    removal_service = RemovalService.new('tile')
    removal_service.remove_single_word

    expect(Anagram.count).to eq(3)
    expect(Word.count).to eq(3)
  end

  it 'can remove a single word and orphaned anagram from the database' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath'])
    anagram_creator.log_anagrams
    
    expect(Anagram.count).to eq(3)
    expect(Word.count).to eq(4)

    removal_service = RemovalService.new('dog')
    removal_service.remove_single_word

    expect(Anagram.count).to eq(2)
    expect(Word.count).to eq(3)
  end

  it 'can remove all data from the database' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath'])
    anagram_creator.log_anagrams
    
    expect(Anagram.count).to eq(3)
    expect(Word.count).to eq(4)

    removal_service = RemovalService.new
    removal_service.remove_all_data

    expect(Anagram.count).to eq(0)
    expect(Word.count).to eq(0)
  end
end
