require 'rails_helper'

describe RemovalService do
  it 'exists' do
    removal_chron_service = RemovalChronService.new

    expect(removal_chron_service).to be_an(RemovalChronService)
  end

  it 'can remove all orphaned anagrams from the database' do
    anagram_creator = AnagramCreator.new(['tile', 'lite', 'dog', 'bath', 'baseball'])
    anagram_creator.log_anagrams
    
    expect(Anagram.count).to eq(4)
    expect(Word.count).to eq(5)

    Word.find_by_spelling('tile').destroy
    Word.find_by_spelling('dog').destroy
    Word.find_by_spelling('baseball').destroy

    expect(Anagram.count).to eq(4)
    expect(Word.count).to eq(2)

    removal_chron_service = RemovalChronService.new
    removal_chron_service.cleanup_anagrams

    expect(Anagram.count).to eq(2)
    expect(Word.count).to eq(2)
  end
end
