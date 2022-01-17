class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.integer :user_id, null: false
      
      t.string  :company_name
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :phone, null: false
      t.string  :email
      
      t.timestamps
    end
    
    add_index :vendors, :user_id
    add_index :vendors, :email
  end
end
