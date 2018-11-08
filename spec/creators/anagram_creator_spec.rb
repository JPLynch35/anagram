require 'rails_helper'

describe AnagramCreator do
  it 'exists' do
    anagram_creator = AnagramCreator.new(['open'])

    expect(anagram_creator).to be_an(AnagramCreator)
  end

  it 'creates an angram object and word object if neither are found' do
    anagram_creator = AnagramCreator.new(['tile'])

    expect(Anagram.count).to eq(0)
    expect(Word.count).to eq(0)

    anagram_creator.log_anagrams

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)
  end

  it 'does not create an angram object if anagram found' do
    anagram_creator1 = AnagramCreator.new(['tile'])
    anagram_creator1.log_anagrams

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)

    anagram_creator2 = AnagramCreator.new(['lite'])
    anagram_creator2.log_anagrams

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(2)
  end

  it 'does not create an angram object or word object if both found' do
    anagram_creator1 = AnagramCreator.new(['tile'])
    anagram_creator1.log_anagrams

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)

    anagram_creator2 = AnagramCreator.new(['tile'])
    anagram_creator2.log_anagrams

    expect(Anagram.count).to eq(1)
    expect(Word.count).to eq(1)
  end
end
