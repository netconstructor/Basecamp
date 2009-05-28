class AddInvitationFromUserToActivation < ActiveRecord::Migration
  def self.up
    add_column :activations, :invitation_from_user, :integer
  end

  def self.down
    remove_column :activations, :invitation_from_user
  end
end
