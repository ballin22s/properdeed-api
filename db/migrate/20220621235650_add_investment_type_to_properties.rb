class AddInvestmentTypeToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :investment_type, :integer
  end
end
