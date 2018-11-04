class Word < ApplicationRecord
  validates_presence_of :spelling, :anagram_key_id
  belongs_to :anagram_key
  after_destroy :destroy_orphaned_parent

  private

  def destroy_orphaned_parent
    anagram_key.destroy if anagram_key.words.empty?
  end
end
