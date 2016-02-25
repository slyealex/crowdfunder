# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160225224845) do

  create_table "categories", force: :cascade do |t|
    t.string   "Art"
    t.string   "Comics"
    t.string   "Crafts"
    t.string   "Dance"
    t.string   "Design"
    t.string   "Fashion"
    t.string   "Film"
    t.string   "Video"
    t.string   "Food"
    t.string   "Games"
    t.string   "Journalism"
    t.string   "Music"
    t.string   "Photography"
    t.string   "Publishing"
    t.string   "Technology"
    t.string   "Theater"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reward_id"
  end

  add_index "pledges", ["project_id"], name: "index_pledges_on_project_id"
  add_index "pledges", ["reward_id"], name: "index_pledges_on_reward_id"
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "goal"
    t.datetime "end_date"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "amount"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rewards", ["project_id"], name: "index_rewards_on_project_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
