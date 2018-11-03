class Word < ApplicationRecord
  validates_presence_of :spelling, :anagram_key_id
  belongs_to :anagram_key

end
