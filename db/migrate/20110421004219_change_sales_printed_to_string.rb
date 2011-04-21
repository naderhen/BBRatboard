class ChangeSalesPrintedToString < ActiveRecord::Migration
  def self.up
    add_column :sales, :reprint, :boolean, :default => false
  end

  def self.down
    remove_column :sales, :reprint
  end
end