class Todo < ActiveRecord::Base
  include AASM
  belongs_to :proj
  belongs_to :user
  
  default_scope :deleted => false
  
  
  validates_presence_of :proj_id
  validates_presence_of :user_id
  
  
  
  aasm_column :completed
  aasm_initial_state :not_completed
  
  aasm_state :completed
  aasm_state :not_completed
  
  aasm_event :setcompleted do
    transitions :to => :completed, :from => [:not_completed]
  end
  
  aasm_event :not_completed do
    transitions :to => :not_completed, :from => [:completed]
  end
end
