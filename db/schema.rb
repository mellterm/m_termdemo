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

ActiveRecord::Schema.define(:version => 20110329045905) do

  create_table "associations", :force => true do |t|
    t.text    "description"
    t.integer "associable_id"
    t.string  "associable_type"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "company_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.string   "document_type"
    t.integer  "user_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["provider_id"], :name => "index_documents_on_provider_id"

  create_table "domain_spaces", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "default_domain_id"
    t.integer  "default_source_doc_id"
    t.integer  "default_source_language_id"
    t.integer  "default_target_language_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", :force => true do |t|
    t.string   "content"
    t.integer  "language_id"
    t.string   "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "segments", ["content"], :name => "index_segments_on_content"

  create_table "source_docs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "source_language_id"
    t.integer  "target_language_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", :force => true do |t|
    t.integer  "translation_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.string   "content"
    t.integer  "language_id"
    t.string   "definition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terms", ["content"], :name => "index_terms_on_content"

  create_table "translations", :force => true do |t|
    t.integer "source_id"
    t.integer "target_id"
    t.boolean "is_public", :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "first_name",                         :null => false
    t.string   "last_name",                          :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
