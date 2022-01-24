class AddWebsiteToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :website, :text
  end
end
