# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_12_023405) do

  create_table "funds", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pitch_id"
    t.index ["pitch_id"], name: "index_funds_on_pitch_id"
    t.index ["user_id"], name: "index_funds_on_user_id"
  end

  create_table "pitches", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "video_link"
    t.integer "funding_goal"
    t.integer "user_id"
    t.string "genre"
    t.index ["user_id"], name: "index_pitches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
