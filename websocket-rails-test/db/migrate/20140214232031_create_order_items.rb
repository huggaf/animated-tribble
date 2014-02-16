class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false, default: 1
      t.decimal :value, null: false, default: 0.0, scale: 2, precision: 15
      t.decimal :total, null: false, default: 0.0, scale: 2, precision: 15

      t.timestamps
    end

    add_index :order_items, :order_id
    add_index :order_items, :product_id

    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :products
  end
end
