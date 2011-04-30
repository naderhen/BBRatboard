class AddFieldsToPredictions < ActiveRecord::Migration
  def self.up
    add_column :predictions, :swordhi, :float
    add_column :predictions, :swodlow, :float
    add_column :predictions, :mahihi, :float
    add_column :predictions, :mahilow, :float
    add_column :predictions, :wahoohi, :float
    add_column :predictions, :wahoolow, :float
  end

  def self.down
    remove_column :predictions, :swordhi
    remove_column :predictions, :swodlow
    remove_column :predictions, :mahihi
    remove_column :predictions, :mahilow
    remove_column :predictions, :wahoohi
    remove_column :predictions, :wahoolow
  end
end