class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid, default: "uuid_generate_v1()" do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :email
    add_index :users, :status
  end
end
