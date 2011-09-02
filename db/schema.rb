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

ActiveRecord::Schema.define(:version => 20110902175715) do

  create_table "carriers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestone_tasks", :force => true do |t|
    t.integer  "MilestoneValidationID"
    t.integer  "ScopeTypeID"
    t.integer  "PercentageID"
    t.integer  "ParentMilestoneTaskID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestone_validations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_test_objects", :force => true do |t|
    t.string   "name"
    t.float    "cost"
    t.boolean  "is_active"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "scope_types", :force => true do |t|
    t.string   "name"
    t.integer  "ProjectTypeID"
    t.boolean  "_5p"
    t.boolean  "_5b"
    t.boolean  "_10p"
    t.boolean  "_10b"
    t.boolean  "_15p"
    t.boolean  "_15b"
    t.boolean  "_20p"
    t.boolean  "_20b"
    t.boolean  "_25p"
    t.boolean  "_25b"
    t.boolean  "_30p"
    t.boolean  "_30b"
    t.boolean  "_35p"
    t.boolean  "_35b"
    t.boolean  "_40p"
    t.boolean  "_40b"
    t.boolean  "_45p"
    t.boolean  "_45b"
    t.boolean  "_50p"
    t.boolean  "_50b"
    t.boolean  "_55p"
    t.boolean  "_55b"
    t.boolean  "_60p"
    t.boolean  "_60b"
    t.boolean  "_65p"
    t.boolean  "_65b"
    t.boolean  "_70p"
    t.boolean  "_70b"
    t.boolean  "_75p"
    t.boolean  "_75b"
    t.boolean  "_80p"
    t.boolean  "_80b"
    t.boolean  "_85p"
    t.boolean  "_85b"
    t.boolean  "_90p"
    t.boolean  "_90b"
    t.boolean  "_95p"
    t.boolean  "_95b"
    t.boolean  "_100p"
    t.boolean  "_100b"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_sites", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
