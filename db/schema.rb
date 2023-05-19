# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_22_181810) do
  create_table "course_takens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade_received"
    t.index ["user_id"], name: "index_course_takens_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "class_number"
    t.string "description"
    t.integer "credit_hours"
    t.string "class_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "instructor_id"
    t.integer "grader_id"
    t.integer "rating"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
  end

  create_table "instructor_recommendations", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.integer "student_id", null: false
    t.integer "section_id", null: false
    t.string "date"
    t.boolean "student_applied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_instructor_recommendations_on_instructor_id"
    t.index ["section_id"], name: "index_instructor_recommendations_on_section_id"
    t.index ["student_id"], name: "index_instructor_recommendations_on_student_id"
  end

  create_table "section_instructors", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.integer "teaching_assistant_id"
    t.integer "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_section_instructors_on_instructor_id"
    t.index ["section_id"], name: "index_section_instructors_on_section_id"
    t.index ["teaching_assistant_id"], name: "index_section_instructors_on_teaching_assistant_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "start_time"
    t.string "end_time"
    t.string "num_of_days"
    t.string "campus"
    t.string "term"
    t.integer "graders_needed", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_lab"
    t.string "instructionMode"
    t.boolean "sunday"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  create_table "student_applications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "section_id", null: false
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "student_available", default: false
    t.integer "student_preference"
    t.index ["section_id"], name: "index_student_applications_on_section_id"
    t.index ["user_id"], name: "index_student_applications_on_user_id"
  end

  create_table "student_graders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_student_graders_on_section_id"
    t.index ["user_id"], name: "index_student_graders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "role"
    t.boolean "is_approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_takens", "users"
  add_foreign_key "evaluations", "courses", on_delete: :nullify
  add_foreign_key "evaluations", "users", column: "grader_id"
  add_foreign_key "evaluations", "users", column: "instructor_id"
  add_foreign_key "instructor_recommendations", "sections"
  add_foreign_key "instructor_recommendations", "users", column: "instructor_id"
  add_foreign_key "instructor_recommendations", "users", column: "student_id"
  add_foreign_key "section_instructors", "sections"
  add_foreign_key "section_instructors", "users", column: "instructor_id"
  add_foreign_key "section_instructors", "users", column: "teaching_assistant_id"
  add_foreign_key "sections", "courses"
  add_foreign_key "student_applications", "sections"
  add_foreign_key "student_applications", "users"
  add_foreign_key "student_graders", "sections"
  add_foreign_key "student_graders", "users"
end
