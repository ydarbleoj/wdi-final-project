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

ActiveRecord::Schema.define(version: 20140319003952) do

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "journey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["journey_id"], name: "index_comments_on_journey_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "friends", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["friend_id"], name: "index_friends_on_friend_id"
  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "journeys", force: true do |t|
    t.text     "title"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journeys", ["user_id"], name: "index_journeys_on_user_id"

  create_table "messages", force: true do |t|
    t.text     "subject"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "video"
    t.string   "photo"
    t.text     "text"
    t.text     "caption"
    t.integer  "journey_id"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["journey_id"], name: "index_posts_on_journey_id"

end
