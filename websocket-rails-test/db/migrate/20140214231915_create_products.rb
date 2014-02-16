class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, default:0, scale: 2, precision: 15

      t.timestamps
    end

    add_index :products, :name, unique: true
  end
end
