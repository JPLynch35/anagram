class AddIndexToAnagramKey < ActiveRecord::Migration[5.1]
  def change
    add_index :anagram_keys, :sorted_spelling
  end
end
