class User < ActiveRecord::Migration
  def change
    create_table "users", force: true do |t|
      t.string   "username", null: false, unique: true

      t.timestamps
    end

    create_table "contacts", force: true do |t|
      t.string   "name"
      t.string   "email", null: false, unique: true
      t.integer  "user_id", null: false

      t.timestamps
    end

    create_table "contact_shares", force: true do |t|
      t.integer   "contact_id", null: false
      t.integer   "user_id", null: false

      t.timestamps
    end

    add_index "contact_shares", ["contact_id"], name: "index_contact_shares_on_contact"
    add_index "contact_shares", ["user_id"], name: "index_contact_shares_on_user_id"
    add_index "contacts", ["user_id"], name: "index_contact_on_user"
  end
end

#      t.string   "name", null: false
#      t.string   "email", null: false, unique: true