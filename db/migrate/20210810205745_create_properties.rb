class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :user_id, null: false
      
      t.integer :multi_unit, null: false
      t.integer :property_type, null: false
      t.string  :name
  
      t.timestamps
    end
    
    add_index :properties, :user_id
    add_index :properties, :multi_unit
    add_index :properties, :property_type
  end
end
