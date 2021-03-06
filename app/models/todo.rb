class Todo < ActiveRecord::Base
  include AASM
  belongs_to :proj
  belongs_to :user
  belongs_to :todolist

  
  named_scope :completed_todo, :conditions => {:completed => "completed"}
  named_scope :incomplete_todo, :conditions => {:completed => "not_completed"}
  
  
  
  
  validates_presence_of :proj_id
#  validates_presence_of :user_id
  
  def iscompleted
    if self.completed=="completed"
      return true
    else
      return false
    end
  end
  
  
  aasm_column :completed
  aasm_initial_state :not_completed
  
  aasm_state :completed
  aasm_state :not_completed
  
  aasm_event :setcompleted do
    transitions :to => :completed, :from => [:not_completed]
  end
  
  aasm_event :setnotcompleted do
    transitions :to => :not_completed, :from => [:completed]
  end
  
  protected

  before_create :nouser

  def nouser
	if self.user.blank?
	   self.user_id=0;
        end
  end
  
  
end
