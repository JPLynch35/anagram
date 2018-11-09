class Anagram < ApplicationRecord
  validates_presence_of :sorted_spelling
  validates_uniqueness_of :sorted_spelling
  has_many :words
end
