class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :property_id, null: false
      
      t.string  :name, null: false
      t.string  :bed, null: false
      t.string  :bath, null: false

      t.timestamps
    end
    
    add_index :units, :property_id
  end
end
