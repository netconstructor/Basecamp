class AddRemovedToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :removed, :boolean, :default => false
  end

  def self.down
    remove_column :categories, :removed
  end
end
