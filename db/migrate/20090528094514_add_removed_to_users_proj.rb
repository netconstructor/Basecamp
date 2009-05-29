class AddRemovedToUsersProj < ActiveRecord::Migration
  def self.up
    add_column :users_projs, :removed, :boolean, :default=>false
  end

  def self.down
    remove_column :users_projs, :removed
  end
end
