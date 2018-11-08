require 'rails_helper'

describe AnagramPresenter do
  it 'exists' do
    anagram_presenter = AnagramPresenter.new('tank')

    expect(anagram_presenter).to be_an(AnagramPresenter)
  end

  it 'can reformat output to a hash with an anagrams collection' do
    anagrams = AnagramCreator.new(['dog', 'tile', 'floor', 'lite'])
    anagrams.log_anagrams
    presenter = AnagramPresenter.new('lite')
  
    expected = {
      anagrams: ['tile']
    }

    expect(presenter.display_anagrams).to eq(expected)
  end

  it 'can limit output based on user input' do
    anagrams = AnagramCreator.new(['cat', 'tac', 'floor', 'act'])
    anagrams.log_anagrams
    presenter = AnagramPresenter.new('tac', 1)
  
    expected = {
      anagrams: ['act']
    }

    expect(presenter.display_anagrams).to eq(expected)
  end

  it 'can display an empty anagrams collection if no matches found' do
    anagrams = AnagramCreator.new(['dog', 'floor', 'lite'])
    anagrams.log_anagrams
    presenter = AnagramPresenter.new('lite')
  
    expected = {
      anagrams: []
    }

    expect(presenter.display_anagrams).to eq(expected)
  end
end
