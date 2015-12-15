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

ActiveRecord::Schema.define(version: 20151214213437) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "black_days", force: true do |t|
    t.integer  "day"
    t.integer  "month"
    t.date     "black_date"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "challenges", force: true do |t|
    t.string   "time"
    t.string   "title"
    t.text     "description"
    t.integer  "day_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "week_id"
  end

  add_index "challenges", ["category_id"], name: "index_challenges_on_category_id", using: :btree
  add_index "challenges", ["day_id"], name: "index_challenges_on_day_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "challege_id"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["challege_id"], name: "index_comments_on_challege_id", using: :btree
  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "days", force: true do |t|
    t.integer  "number"
    t.string   "name"
    t.integer  "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "required_knowledge"
    t.text     "cheatsheet"
    t.integer  "product_id"
    t.date     "schedule"
  end

  add_index "days", ["product_id"], name: "index_days_on_product_id", using: :btree
  add_index "days", ["week_id"], name: "index_days_on_week_id", using: :btree

  create_table "deliveries", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commit"
    t.integer  "status"
    t.string   "git_ssh_url"
    t.string   "project_id"
  end

  add_index "deliveries", ["challenge_id"], name: "index_deliveries_on_challenge_id", using: :btree
  add_index "deliveries", ["user_id"], name: "index_deliveries_on_user_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "product_id"
    t.integer  "promo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "enrollments", ["product_id"], name: "index_enrollments_on_product_id", using: :btree
  add_index "enrollments", ["promo_id"], name: "index_enrollments_on_promo_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "parameters", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "promos", force: true do |t|
    t.integer  "number"
    t.string   "name"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "git_url"
    t.string   "git_group"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gitlab_user"
    t.string   "name"
    t.string   "name_space_id"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  add_index "videos", ["day_id"], name: "index_videos_on_day_id", using: :btree

  create_table "weeks", force: true do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "position"
    t.integer  "product_id"
  end

  add_index "weeks", ["product_id"], name: "index_weeks_on_product_id", using: :btree

end
