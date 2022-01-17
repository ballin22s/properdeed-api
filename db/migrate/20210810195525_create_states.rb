class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string  :name, null: false
      t.string  :abbr, null: false

      t.timestamps
    end
    
    add_index :states, :abbr
  end
end
