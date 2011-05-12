class AddReprintButPrintedToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :reprint_but_printed, :boolean
  end

  def self.down
    remove_column :sales, :reprint_but_printed
  end
end