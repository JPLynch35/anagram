class Anagram < ApplicationRecord
  validates_presence_of :sorted_spelling
  has_many :words
end
