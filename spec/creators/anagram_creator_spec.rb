require 'rails_helper'

describe AnagramCreator do
  it 'exists' do
    anagram_creator = AnagramCreator.new(['open'])

    expect(anagram_creator).to be_an(AnagramCreator)
  end
end
