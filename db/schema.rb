# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_110006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.bigint "resume_id", null: false
    t.text "achievement_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resume_id"], name: "index_achievements_on_resume_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "institute_name"
    t.date "year_of_passing"
    t.decimal "percentage"
    t.bigint "qualification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["qualification_id"], name: "index_educations_on_qualification_id"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "url"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "qualification_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string "objective"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill_name"
    t.string "skill_description"
    t.bigint "resume_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resume_id"], name: "index_skills_on_resume_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "contact"
    t.string "password_enc"
    t.string "city"
    t.string "address"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "achievements", "resumes"
  add_foreign_key "educations", "qualifications"
  add_foreign_key "educations", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "resumes", "users"
  add_foreign_key "skills", "resumes"
end
