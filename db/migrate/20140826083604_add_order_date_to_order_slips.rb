class AddOrderDateToOrderSlips < ActiveRecord::Migration
  def change
    add_column :order_slips, :order_date, :date
  end
end
