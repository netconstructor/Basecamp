class AddDeleteColumnToAllTables < ActiveRecord::Migration
  def self.up
    add_column :users, :deleted, :boolean, :default => false
    add_column :departments, :deleted, :boolean, :default => false
    add_column :todos, :deleted, :boolean, :default => false
    add_column :messages, :deleted, :boolean, :default => false
    add_column :attachments, :deleted, :boolean, :default => false
    add_column :activations, :deleted, :boolean, :default => false
    add_column :projs, :deleted, :boolean, :default => false
    add_column :comments, :deleted, :boolean, :default => false
    add_column :milestones, :deleted, :boolean, :default => false
    add_column :todolists, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column :users, :deleted
    remove_column :departments, :deleted
    remove_column :todos, :deleted
    remove_column :messages, :deleted
    remove_column :attachments, :deleted
    remove_column :activations, :deleted
    remove_column :projs, :deleted
    remove_column :comments, :deleted
    remove_column :milestones, :deleted
    remove_column :todolists, :deleted
  end
end
