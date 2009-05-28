class AddNameUserIdProjIdToMilestone < ActiveRecord::Migration
  def self.up
    add_column :milestones, :name, :string
    add_column :milestones, :user_id, :integer
    add_column :milestones, :proj_id, :integer
  end

  def self.down
    remove_column :milestones, :proj_id
    remove_column :milestones, :user_id
    remove_column :milestones, :name
  end
end
