class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :property_id, null: false
      t.string  :name

      t.timestamps
    end
  end
end
