class CreateVendorAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_addresses do |t|
      t.integer :vendor_id, null: false
      t.integer :state_id, null: false
      
      t.string :street1
      t.string :street2
      t.string :city, null: false
      t.string :zip, null: false

      t.timestamps
    end
    
    add_index :vendor_addresses, :property_id
    add_index :vendor_addresses, :state_id
    add_index :vendor_addresses, :city
    add_index :vendor_addresses, :zip
  end
end
