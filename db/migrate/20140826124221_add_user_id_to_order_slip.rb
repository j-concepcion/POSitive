class AddUserIdToOrderSlip < ActiveRecord::Migration
  def change
    add_column :order_slips, :user_id, :uuid
  end
end
