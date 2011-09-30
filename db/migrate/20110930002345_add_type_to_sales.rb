class AddTypeToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :species_type, :string
  end
end
