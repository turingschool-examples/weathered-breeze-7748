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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_164211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.string "name"
    t.text "objective"
    t.integer "num_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiments_scientists", id: false, force: :cascade do |t|
    t.bigint "experiment_id", null: false
    t.bigint "scientist_id", null: false
    t.index ["experiment_id", "scientist_id"], name: "index_experiments_scientists_on_experiment_id_and_scientist_id"
    t.index ["scientist_id", "experiment_id"], name: "index_experiments_scientists_on_scientist_id_and_experiment_id"
  end

  create_table "labs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scientists", force: :cascade do |t|
    t.string "name"
    t.string "specialty"
    t.string "university"
    t.bigint "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_scientists_on_lab_id"
  end

  add_foreign_key "scientists", "labs"
end
