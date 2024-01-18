# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_18_122206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baseball_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hiragana"
    t.string "katakana"
    t.string "alphabet"
  end

  create_table "game_results", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "match_result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_result_id"], name: "index_game_results_on_match_result_id"
    t.index ["user_id"], name: "index_game_results_on_user_id"
  end

  create_table "match_results", force: :cascade do |t|
    t.integer "game_id"
    t.bigint "user_id", null: false
    t.datetime "date_and_time", null: false
    t.string "match_type", null: false
    t.bigint "my_team_id_id", null: false
    t.bigint "opponent_team_id_id", null: false
    t.integer "my_team_score", null: false
    t.integer "opponent_team_score", null: false
    t.string "batting_order", null: false
    t.string "defensive_position", null: false
    t.integer "tournament_id"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_team_id_id"], name: "index_match_results_on_my_team_id_id"
    t.index ["opponent_team_id_id"], name: "index_match_results_on_opponent_team_id_id"
    t.index ["user_id"], name: "index_match_results_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hiragana"
    t.string "katakana"
    t.string "alphabet"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id", null: false
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_teams_on_category_id"
    t.index ["prefecture_id"], name: "index_teams_on_prefecture_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_awards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "award_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["award_id"], name: "index_user_awards_on_award_id"
    t.index ["user_id"], name: "index_user_awards_on_user_id"
  end

  create_table "user_positions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_user_positions_on_position_id"
    t.index ["user_id"], name: "index_user_positions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.text "introduction"
    t.text "positions"
    t.integer "team_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

  add_foreign_key "game_results", "match_results"
  add_foreign_key "game_results", "users"
  add_foreign_key "match_results", "teams", column: "my_team_id_id"
  add_foreign_key "match_results", "teams", column: "opponent_team_id_id"
  add_foreign_key "match_results", "users"
  add_foreign_key "teams", "baseball_categories", column: "category_id"
  add_foreign_key "teams", "prefectures"
  add_foreign_key "user_awards", "awards"
  add_foreign_key "user_awards", "users"
  add_foreign_key "user_positions", "positions"
  add_foreign_key "user_positions", "users"
end
