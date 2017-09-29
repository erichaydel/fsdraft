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

ActiveRecord::Schema.define(version: 20170906022219) do

  create_table "fantasy_teams", force: :cascade do |t|
    t.string "name"
    t.integer "draft_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "team"
    t.string "firstname"
    t.string "lastname"
    t.text "position"
    t.integer "rank"
    t.integer "position_rank"
    t.string "type"
    t.integer "roster_id"
    t.integer "draft_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firstname", "lastname", "team", "type"], name: "index_players_on_firstname_and_lastname_and_team_and_type", unique: true
  end

  create_table "roster_settings", force: :cascade do |t|
    t.text "definition", default: "---\n:NFL: []\n:NHL: []\n:NBA: []\n:MLB: []\n"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "league_password"
  end

  create_table "roster_spots", force: :cascade do |t|
    t.text "position"
    t.integer "roster_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_roster_spots_on_player_id", unique: true
  end

  create_table "rosters", force: :cascade do |t|
    t.integer "fantasy_team_id"
    t.string "sport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false
    t.integer "fantasy_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
