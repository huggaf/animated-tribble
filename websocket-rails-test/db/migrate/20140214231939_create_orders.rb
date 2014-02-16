class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :status, null: false, default: 'open'

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, :status

    add_foreign_key :orders, :users
  end
end
