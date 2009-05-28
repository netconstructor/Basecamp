class AddEmailAddressToActivation < ActiveRecord::Migration
  def self.up
    add_column :activations, :email_address, :string
  end

  def self.down
    remove_column :activations, :email_address
  end
end
