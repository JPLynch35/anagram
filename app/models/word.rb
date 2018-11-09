class Word < ApplicationRecord
  validates_presence_of :spelling, :anagram_id
  validates_uniqueness_of :spelling
  belongs_to :anagram
end
