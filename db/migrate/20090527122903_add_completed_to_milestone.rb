class AddCompletedToMilestone < ActiveRecord::Migration
  def self.up
    add_column :milestones, :completed, :string, :default=>"not_completed"
  end

  def self.down
    remove_column :milestones 
  end
end
