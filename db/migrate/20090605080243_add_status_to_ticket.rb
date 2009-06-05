class AddStatusToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :status, :string, :default => "New"
  end

  def self.down
    remove_column :tickets, :status
  end
end
