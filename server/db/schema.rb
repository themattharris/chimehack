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

ActiveRecord::Schema.define(version: 20131207074336) do

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "target",                precision: 8, scale: 2
    t.string   "currency",    limit: 5
    t.decimal  "current",               precision: 8, scale: 2
    t.datetime "target_date"
    t.integer  "creator_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", force: true do |t|
    t.string   "currency",              limit: 5
    t.decimal  "value",                           precision: 8, scale: 2
    t.string   "transaction_id"
    t.integer  "transaction_source_id"
    t.integer  "donor_id"
    t.integer  "referrer_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incentives", force: true do |t|
    t.integer  "value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_users", force: true do |t|
    t.integer "user_id"
    t.integer "team_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
