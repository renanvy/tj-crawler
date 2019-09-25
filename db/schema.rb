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

ActiveRecord::Schema.define(version: 2019_09_25_014234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "judicial_processes", force: :cascade do |t|
    t.string "number", null: false
    t.string "kind", null: false
    t.string "area", null: false
    t.string "subject", null: false
    t.string "distribution_date", null: false
    t.string "judge", null: false
    t.string "action_value", null: false
    t.datetime "crawler_updated_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_judicial_processes_on_number", unique: true
  end

  create_table "movimentations", force: :cascade do |t|
    t.date "date", null: false
    t.text "description", null: false
    t.bigint "judicial_process_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["judicial_process_id"], name: "index_movimentations_on_judicial_process_id"
  end

  add_foreign_key "movimentations", "judicial_processes"
end
