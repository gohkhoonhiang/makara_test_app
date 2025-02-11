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

ActiveRecord::Schema[7.0].define(version: 2024_07_18_055222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "point_transactions", force: :cascade do |t|
    t.integer "amount"
    t.bigint "wallet_id"
    t.bigint "voucher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voucher_id"], name: "index_point_transactions_on_voucher_id"
    t.index ["wallet_id"], name: "index_point_transactions_on_wallet_id"
  end

  create_table "vouchers", force: :cascade do |t|
    t.string "title"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.integer "balance", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
