class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :birthday, :date
    add_column :users, :contact_number, :string
    add_column :users, :address, :string
  end
end
