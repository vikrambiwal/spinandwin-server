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

ActiveRecord::Schema.define(version: 20200411112137) do

  create_table "coins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "coin_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redeems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "phone",      default: ""
    t.string   "amount",     default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "username",        default: ""
    t.string   "email",           default: ""
    t.string   "phone",           default: ""
    t.string   "password_digest"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["phone"], name: "index_users_on_phone", using: :btree
  end

end
