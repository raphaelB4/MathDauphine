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

ActiveRecord::Schema.define(version: 20170301092422) do

  create_table "chapters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "corrections", force: :cascade do |t|
    t.integer  "problem_id"
    t.integer  "scholar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id", "scholar_id"], name: "index_corrections_on_problem_id_and_scholar_id", unique: true
    t.index ["problem_id"], name: "index_corrections_on_problem_id"
    t.index ["scholar_id"], name: "index_corrections_on_scholar_id"
  end

  create_table "eleves", force: :cascade do |t|
    t.string   "nom"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "exercices", force: :cascade do |t|
    t.integer  "chapter_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "issue"
    t.string   "solution"
    t.integer  "answer"
    t.integer  "nature",             default: 0
    t.text     "statement"
    t.text     "solution_statement"
    t.index ["chapter_id"], name: "index_exercices_on_chapter_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_students_on_email", unique: true
  end

end
