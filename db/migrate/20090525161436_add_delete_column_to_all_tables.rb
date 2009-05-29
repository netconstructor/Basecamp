class AddDeleteColumnToAllTables < ActiveRecord::Migration
  def self.up
    add_column :users, :removed, :boolean, :default => false
    add_column :departments, :removed, :boolean, :default => false
    add_column :todos, :removed, :boolean, :default => false
    add_column :messages, :removed, :boolean, :default => false
    add_column :attachments, :removed, :boolean, :default => false
    add_column :activations, :removed, :boolean, :default => false
    add_column :projs, :removed, :boolean, :default => false
    add_column :comments, :removed, :boolean, :default => false
    add_column :milestones, :removed, :boolean, :default => false
    add_column :todolists, :removed, :boolean, :default => false
  end

  def self.down
    remove_column :users, :removed
    remove_column :departments, :removed
    remove_column :todos, :removed
    remove_column :messages, :removed
    remove_column :attachments, :removed
    remove_column :activations, :removed
    remove_column :projs, :removed
    remove_column :comments, :removed
    remove_column :milestones, :removed
    remove_column :todolists, :removed
  end
end
