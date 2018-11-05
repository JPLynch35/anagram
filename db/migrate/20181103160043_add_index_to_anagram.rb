class AddIndexToAnagram < ActiveRecord::Migration[5.1]
  def change
    add_index :anagrams, :sorted_spelling
  end
end
