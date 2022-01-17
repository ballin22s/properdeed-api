class CreatePropertyAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :property_addresses do |t|
      t.integer :property_id, null: false
      t.integer :state_id, null: false
      
      t.string :street1, null: false
      t.string :street2
      t.string :city, null: false
      t.string :zip, null: false
      
      t.timestamps
    end
    
    add_index :property_addresses, :property_id
    add_index :property_addresses, :state_id
    add_index :property_addresses, :city
    add_index :property_addresses, :zip
  end
end
