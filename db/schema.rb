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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130111152554) do

  create_table "authors", :force => true do |t|
    t.integer  "author_id"
    t.string   "name"
    t.text     "biography"
    t.datetime "born"
    t.datetime "died"
    t.integer  "books"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "books", :force => true do |t|
    t.integer  "book_id"
    t.string   "name"
    t.text     "description"
    t.datetime "release"
    t.integer  "isbn"
    t.boolean  "available"
    t.text     "kind"
    t.text     "slogan"
    t.integer  "location_id"
    t.integer  "author_id"
    t.integer  "genre_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "fullname"
    t.boolean  "downloadable"
  end

  add_index "books", ["author_id"], :name => "index_books_on_author_id"
  add_index "books", ["genre_id"], :name => "index_books_on_genre_id"
  add_index "books", ["location_id"], :name => "index_books_on_location_id"

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "users_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "groups", ["users_id"], :name => "index_groups_on_users_id"

  create_table "links", :force => true do |t|
    t.string   "label"
    t.string   "url"
    t.text     "tooltip"
    t.integer  "book_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["book_id"], :name => "index_links_on_book_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "books_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tags", ["books_id"], :name => "index_tags_on_books_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.integer  "books_id"
    t.integer  "authors_id"
    t.integer  "genres_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "users", ["authors_id"], :name => "index_users_on_authors_id"
  add_index "users", ["books_id"], :name => "index_users_on_books_id"
  add_index "users", ["genres_id"], :name => "index_users_on_genres_id"

end
