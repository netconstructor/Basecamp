# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090529130835) do

  create_table "activations", :force => true do |t|
    t.integer  "user_id"
    t.string   "activation_number"
    t.string   "activation_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_address"
    t.integer  "invitation_from_user"
    t.boolean  "removed",              :default => false
  end

  create_table "attachments", :force => true do |t|
    t.integer  "message_id"
    t.string   "name"
    t.string   "type_attachment"
    t.string   "size_attachment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",         :default => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",    :default => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "message_id"
    t.integer  "todo_id"
    t.text     "comment_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",      :default => false
    t.integer  "user_id"
  end

  create_table "departments", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",    :default => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proj_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.boolean  "removed",     :default => false
    t.integer  "category_id"
  end

  create_table "milestones", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",    :default => false
    t.string   "name"
    t.integer  "user_id"
    t.integer  "proj_id"
    t.date     "deadline"
    t.string   "completed",  :default => "not_completed"
  end

  create_table "projs", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",     :default => false
    t.string   "proj_status", :default => "Initialised"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todolists", :force => true do |t|
    t.integer  "proj_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",     :default => false
    t.text     "description"
  end

  create_table "todos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proj_id"
    t.text     "todo_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "completed",   :default => "not_completed"
    t.integer  "todolist_id"
    t.boolean  "removed",     :default => false
    t.integer  "list_order",  :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email_address"
    t.string   "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",       :default => false
  end

  create_table "users_projs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proj_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "removed",    :default => false
  end

end
