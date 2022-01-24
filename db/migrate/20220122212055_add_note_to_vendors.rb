class AddNoteToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :note, :text
  end
end
