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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110108030117) do

  create_table "addresses", :force => true do |t|
    t.string "street", :null => false
    t.string "city",   :null => false
    t.string "zip"
  end

  create_table "brands", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "deliveries", :force => true do |t|
    t.integer "sale_id",             :null => false
    t.integer "shipping_address_id", :null => false
    t.integer "customer_id",         :null => false
    t.integer "owner_id"
    t.string  "status",              :null => false
    t.date    "due_date",            :null => false
    t.string  "notes"
  end

  create_table "products", :force => true do |t|
    t.integer "sku"
    t.string  "name",        :null => false
    t.string  "brand"
    t.float   "base_price",  :null => false
    t.text    "description"
    t.integer "brand_id"
  end

  create_table "sale_products", :force => true do |t|
    t.integer "product_id", :null => false
    t.integer "sale_id",    :null => false
    t.float   "price",      :null => false
    t.integer "quantity",   :null => false
  end

  create_table "sales", :force => true do |t|
    t.float    "total",       :null => false
    t.integer  "customer_id", :null => false
    t.integer  "dealer_id",   :null => false
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_products", :force => true do |t|
    t.integer "stock_id",   :null => false
    t.integer "product_id", :null => false
    t.integer "quantity",   :null => false
    t.date    "perish_on"
  end

  create_table "stocks", :force => true do |t|
    t.integer "store_id", :null => false
  end

  create_table "stores", :force => true do |t|
    t.string  "name",       :null => false
    t.integer "address_id"
    t.integer "boss_id"
  end

  create_table "users", :force => true do |t|
    t.string  "type"
    t.string  "email"
    t.string  "name",       :null => false
    t.integer "address_id"
  end

end
