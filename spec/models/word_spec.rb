require 'rails_helper'

describe Word, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:spelling) }
    it { should validate_presence_of(:anagram_key_id) }
  end

  describe 'relationships' do
    it { should belong_to(:anagram_key) }
  end
end
