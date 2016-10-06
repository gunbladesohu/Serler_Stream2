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

ActiveRecord::Schema.define(version: 20160921150226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "journal"
    t.integer  "year"
    t.integer  "volume"
    t.integer  "number"
    t.integer  "month"
    t.string   "pages"
    t.string   "isbn"
    t.string   "doi"
    t.string   "url"
    t.text     "keyword"
    t.text     "abstract"
    t.text     "research_questions"
    t.text     "research_metrics"
    t.integer  "type_id"
    t.integer  "status_id"
    t.boolean  "is_active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "peer_reviewed"
    t.boolean  "relevance"
    t.boolean  "not_duplicate"
    t.integer  "user_id"
    t.integer  "admin_id"
  end

  create_table "articles_authors", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles_dev_methods", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "dev_method_id"
    t.boolean  "is_active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "articles_methodologies", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "methodology_id"
    t.boolean  "is_active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "articles_research_methods", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "research_method_id"
    t.boolean  "is_active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "articles_research_participants", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "research_participant_id"
    t.boolean  "is_active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dev_methods", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "field_tables", force: :cascade do |t|
    t.string   "name"
    t.string   "field"
    t.string   "table"
    t.string   "join_table"
    t.string   "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_conditions", force: :cascade do |t|
    t.integer  "value"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "methodologies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "operators", force: :cascade do |t|
    t.integer  "value"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "article_id"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_methods", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "research_participants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "search_field_values", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_lines", force: :cascade do |t|
    t.integer  "join_condition"
    t.integer  "field_id"
    t.integer  "operator"
    t.integer  "value_id"
    t.string   "value_text"
    t.integer  "value_number"
    t.integer  "search_query_id"
    t.boolean  "isActive"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "search_queries", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "from_date"
    t.integer  "to_date"
    t.text     "sql_string"
    t.boolean  "isActive"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.date     "dob"
    t.string   "affiliation"
    t.boolean  "is_active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "users_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
