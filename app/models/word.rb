class Word < ApplicationRecord
  validates_presence_of :spelling, :anagram_id
  belongs_to :anagram
  after_destroy :destroy_orphaned_parent

  private

  def destroy_orphaned_parent
    anagram.destroy if anagram.words.empty?
  end
end
