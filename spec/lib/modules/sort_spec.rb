require 'rails_helper'
include Sort

describe Sort do
  describe 'methods' do
    it 'can sort the letters in a word alphabetically' do
      word = 'tank'

      expect(sort_letters(word)).to eq('aknt')
    end
  end
end
