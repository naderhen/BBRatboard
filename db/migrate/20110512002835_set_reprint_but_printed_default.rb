class SetReprintButPrintedDefault < ActiveRecord::Migration
  def self.up
    change_column_default :sales, :reprint_but_printed, false
  end

  def self.down
    change_column_default :sales, :reprint_but_printed
  end
end