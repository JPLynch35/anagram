require 'rails_helper'

describe AnagramKey, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:sorted_spelling) }
  end

  describe 'relationships' do
    it { should have_many(:words) }
  end
end
