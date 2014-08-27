class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item_name
      t.integer :quantity
      t.decimal :buying_price
      t.decimal :selling_price
      t.date :date_purchased
      t.date :expiration_date
      t.string :waste_age

      t.timestamps
    end
  end
end
