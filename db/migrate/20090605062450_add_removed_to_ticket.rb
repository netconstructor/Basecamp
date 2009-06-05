class AddRemovedToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :removed, :boolean, :default => false 
  end

  def self.down
    remove_column :tickets, :removed
  end
end
