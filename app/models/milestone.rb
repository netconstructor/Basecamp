class Milestone < ActiveRecord::Base
  belongs_to :proj
  belongs_to :user
  
  validates_presence_of :deadline
  
  def self.list_of_completed
    return Milestone.find(:all,:conditions=>{:completed=>"completed"})
  end
  def self.list_of_already_late
    milestones=[]
    Milestone.find(:all,:conditions=>{:completed=>"not_completed"}).each do |m|
      milestones << m if (Date.today > m.deadline )
    end
    return milestones
  end
  
  def self.list_of_upcoming
    milestones=[]
    Milestone.find(:all,:conditions=>{:completed=>"not_completed"}).each do |m|
      milestones << m if (Date.today <= m.deadline )
    end
    return milestones
  end
end
