class AddSpeciesTypeToSales < ActiveRecord::Migration
  def self.up
  	add_column :sales, :species_type, :string					
  end

  def self.down
  	remove_column :sales, :species_type
  end
end
