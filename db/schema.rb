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

ActiveRecord::Schema[7.2].define(version: 2024_10_10_154508) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "assigner_id", null: false
    t.integer "assignee_id", null: false
    t.bigint "checklist_instance_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_assignments_on_assignee_id"
    t.index ["assigner_id"], name: "index_assignments_on_assigner_id"
    t.index ["checklist_instance_id"], name: "index_assignments_on_checklist_instance_id"
  end

  create_table "checklist_instances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "checklist_template_id", null: false
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_template_id"], name: "index_checklist_instances_on_checklist_template_id"
    t.index ["user_id"], name: "index_checklist_instances_on_user_id"
  end

  create_table "checklist_templates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_checklist_templates_on_user_id"
  end

  create_table "step_instances", force: :cascade do |t|
    t.bigint "checklist_instance_id", null: false
    t.bigint "step_id", null: false
    t.text "note"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_instance_id"], name: "index_step_instances_on_checklist_instance_id"
    t.index ["step_id"], name: "index_step_instances_on_step_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "checklist_template_id", null: false
    t.text "content"
    t.integer "step_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_template_id"], name: "index_steps_on_checklist_template_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "checklist_instances"
  add_foreign_key "assignments", "users", column: "assignee_id"
  add_foreign_key "assignments", "users", column: "assigner_id"
  add_foreign_key "checklist_instances", "checklist_templates"
  add_foreign_key "checklist_instances", "users"
  add_foreign_key "checklist_templates", "users"
  add_foreign_key "step_instances", "checklist_instances"
  add_foreign_key "step_instances", "steps"
  add_foreign_key "steps", "checklist_templates"
end
