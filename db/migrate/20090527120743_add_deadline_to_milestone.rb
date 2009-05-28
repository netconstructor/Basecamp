class AddDeadlineToMilestone < ActiveRecord::Migration
  def self.up
    add_column :milestones, :deadline, :date
  end

  def self.down
    remove_column :milestones, :deadline
  end
end
