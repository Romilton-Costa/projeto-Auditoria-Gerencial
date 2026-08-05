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

ActiveRecord::Schema[8.1].define(version: 2026_08_04_195121) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "audit_details", force: :cascade do |t|
    t.bigint "audit_result_id", null: false
    t.datetime "created_at", null: false
    t.jsonb "metadata"
    t.string "record_id"
    t.datetime "updated_at", null: false
    t.index ["audit_result_id"], name: "index_audit_details_on_audit_result_id"
  end

  create_table "audit_executions", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "executed_at"
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_audit_executions_on_client_id"
  end

  create_table "audit_results", force: :cascade do |t|
    t.bigint "audit_execution_id", null: false
    t.bigint "audit_rule_id", null: false
    t.datetime "created_at", null: false
    t.integer "total_found"
    t.datetime "updated_at", null: false
    t.index ["audit_execution_id"], name: "index_audit_results_on_audit_execution_id"
    t.index ["audit_rule_id"], name: "index_audit_results_on_audit_rule_id"
  end

  create_table "audit_rules", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "category"
    t.string "color"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon"
    t.string "name"
    t.string "severity"
    t.text "sql_query"
    t.datetime "updated_at", null: false
  end

  create_table "client_details", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "cidade"
    t.string "cliente"
    t.datetime "created_at", null: false
    t.string "estado"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audit_details", "audit_results"
  add_foreign_key "audit_executions", "clients"
  add_foreign_key "audit_results", "audit_executions"
  add_foreign_key "audit_results", "audit_rules"
end
