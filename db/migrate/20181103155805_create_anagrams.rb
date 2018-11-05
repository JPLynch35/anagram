class CreateAnagrams < ActiveRecord::Migration[5.1]
  def change
    create_table :anagrams do |t|
      t.string :sorted_spelling

      t.timestamps
    end
  end
end
