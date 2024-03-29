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

ActiveRecord::Schema.define(version: 20160207134016) do

  create_table "active_excercises", force: :cascade do |t|
    t.integer  "how_many",          limit: 4
    t.integer  "excercise_type_id", limit: 4
    t.integer  "training_id",       limit: 4
    t.string   "time",              limit: 255
    t.integer  "puls",              limit: 4
    t.integer  "protege_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "active_excercises", ["excercise_type_id"], name: "index_active_excercises_on_excercise_type_id", using: :btree
  add_index "active_excercises", ["protege_id"], name: "index_active_excercises_on_protege_id", using: :btree
  add_index "active_excercises", ["training_id"], name: "index_active_excercises_on_training_id", using: :btree

  create_table "blood_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "card_indices", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.text     "unit",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "cards", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "protege_id", limit: 4
  end

  add_index "cards", ["created_at"], name: "index_cards_on_card_index_id_and_user_id_and_created_at", using: :btree
  add_index "cards", ["protege_id"], name: "index_cards_on_protege_id", using: :btree

  create_table "done_excercises", force: :cascade do |t|
    t.integer  "how_many",          limit: 4
    t.string   "time",              limit: 255
    t.datetime "start"
    t.datetime "stop"
    t.integer  "training_id",       limit: 4
    t.integer  "excercise_type_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "puls",              limit: 4
    t.integer  "protege_id",        limit: 4
  end

  add_index "done_excercises", ["excercise_type_id"], name: "index_done_excercises_on_excercise_type_id", using: :btree
  add_index "done_excercises", ["training_id"], name: "index_done_excercises_on_training_id", using: :btree

  create_table "excercise_types", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.string   "formula",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "excercises", force: :cascade do |t|
    t.integer  "how_many",          limit: 4
    t.datetime "time"
    t.integer  "training_id",       limit: 4
    t.integer  "excercise_type_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "excercises", ["excercise_type_id"], name: "index_excercises_on_excercise_type_id", using: :btree
  add_index "excercises", ["training_id"], name: "index_excercises_on_training_id", using: :btree

  create_table "eye_colors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "color",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "measure_types", force: :cascade do |t|
    t.text     "name",         limit: 65535
    t.text     "unit",         limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "extra_field",  limit: 1,     default: false
    t.string   "first_label",  limit: 255
    t.string   "second_label", limit: 255
  end

  create_table "measurements", force: :cascade do |t|
    t.float    "value",           limit: 24
    t.integer  "measure_type_id", limit: 4
    t.integer  "card_id",         limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "second_value",    limit: 24
  end

  add_index "measurements", ["card_id"], name: "index_measurements_on_card_id", using: :btree
  add_index "measurements", ["measure_type_id"], name: "index_measurements_on_measure_type_id", using: :btree

  create_table "medicine_times", force: :cascade do |t|
    t.datetime "medicine_time"
    t.boolean  "remind",        limit: 1
    t.datetime "remind_when"
    t.integer  "medicine_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "medicine_times", ["medicine_id"], name: "index_medicine_times_on_medicine_id", using: :btree

  create_table "medicines", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.text     "dose",       limit: 65535
    t.text     "dose_unit",  limit: 65535
    t.integer  "protege_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "medicines", ["protege_id"], name: "index_medicines_on_protege_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_send_id",    limit: 4
    t.integer  "user_receive_id", limit: 4
    t.text     "content",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["user_receive_id"], name: "index_messages_on_user_receive_id", using: :btree
  add_index "messages", ["user_send_id"], name: "index_messages_on_user_send_id", using: :btree

  create_table "proteges", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "trainer_id",    limit: 4
    t.text     "gender",        limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.date     "birth_date"
    t.integer  "eye_color_id",  limit: 4
    t.integer  "blood_type_id", limit: 4
  end

  add_index "proteges", ["trainer_id"], name: "index_proteges_on_trainer_id", using: :btree
  add_index "proteges", ["user_id"], name: "index_proteges_on_user_id", using: :btree

  create_table "trainers", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "active",     limit: 1
  end

  add_index "trainers", ["user_id"], name: "index_trainers_on_user_id", using: :btree

  create_table "trainings", force: :cascade do |t|
    t.integer  "protege_id", limit: 4
    t.datetime "start"
    t.datetime "end"
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "trainings", ["protege_id"], name: "index_trainings_on_protege_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",              limit: 255
    t.string   "email",              limit: 255
    t.string   "name",               limit: 255
    t.string   "surname",            limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "password_digest",    limit: 255
    t.string   "remember_digest",    limit: 255
    t.boolean  "admin",              limit: 1
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "activation_digest",  limit: 255
    t.boolean  "activated",          limit: 1,   default: false
    t.datetime "activated_at"
    t.string   "reset_digest",       limit: 255
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "active_excercises", "excercise_types"
  add_foreign_key "active_excercises", "proteges"
  add_foreign_key "active_excercises", "trainings"
  add_foreign_key "cards", "proteges"
  add_foreign_key "done_excercises", "excercise_types"
  add_foreign_key "done_excercises", "trainings"
  add_foreign_key "excercises", "excercise_types"
  add_foreign_key "excercises", "trainings"
  add_foreign_key "measurements", "cards"
  add_foreign_key "measurements", "measure_types"
  add_foreign_key "medicine_times", "medicines"
  add_foreign_key "medicines", "proteges"
  add_foreign_key "proteges", "trainers"
  add_foreign_key "proteges", "users"
  add_foreign_key "trainers", "users"
  add_foreign_key "trainings", "proteges"
end
