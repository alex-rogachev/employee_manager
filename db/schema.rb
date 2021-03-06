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

ActiveRecord::Schema.define(:version => 20170514141742) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "phone_number"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "applicants", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "nickname"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "post"
    t.text     "notes"
    t.string   "email"
    t.string   "phone_number"
    t.float    "experience"
    t.string   "area_of_expertise"
    t.string   "place_of_residence"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "skype_address"
    t.datetime "deleted_at"
  end

  add_index "applicants", ["deleted_at"], :name => "index_applicants_on_deleted_at"

  create_table "applicants_vacancies", :id => false, :force => true do |t|
    t.integer "applicant_id"
    t.integer "vacancy_id"
  end

  add_index "applicants_vacancies", ["applicant_id", "vacancy_id"], :name => "by_applicant_and_vacancy", :unique => true

  create_table "email_sending_logs", :force => true do |t|
    t.string   "name"
    t.integer  "sent_by"
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "status"
    t.string   "sg_id"
    t.string   "emailable_address"
  end

  add_index "email_sending_logs", ["emailable_address"], :name => "index_email_sending_logs_on_emailable_address"

  create_table "email_templates", :force => true do |t|
    t.string   "name"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "nickname"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "post"
    t.text     "notes"
    t.string   "email"
    t.string   "phone_number"
    t.float    "experience"
    t.string   "area_of_expertise"
    t.string   "place_of_residence"
    t.string   "skype_address"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], :name => "taggings_idx", :unique => true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "vacancies", :force => true do |t|
    t.string   "description"
    t.string   "level"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "technology"
  end

end
