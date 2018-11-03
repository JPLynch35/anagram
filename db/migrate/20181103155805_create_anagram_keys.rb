class CreateAnagramKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :anagram_keys do |t|
      t.string :sorted_spelling

      t.timestamps
    end
  end
end
