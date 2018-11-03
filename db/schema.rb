# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181103160411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anagram_keys", force: :cascade do |t|
    t.string "sorted_spelling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sorted_spelling"], name: "index_anagram_keys_on_sorted_spelling"
  end

  create_table "words", force: :cascade do |t|
    t.string "spelling"
    t.bigint "anagram_key_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anagram_key_id"], name: "index_words_on_anagram_key_id"
  end

  add_foreign_key "words", "anagram_keys"
end