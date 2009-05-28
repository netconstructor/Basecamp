class Activation < ActiveRecord::Base
  include AASM
  belongs_to :user
  
  aasm_column :activation_status
  aasm_initial_state :not_active
  
  aasm_state :active
  aasm_state :not_active
  
  aasm_event :active do
    transitions :to => :active, :from => [:not_active]
  end
  
  aasm_event :deactivate do
    transitions :to => :not_active, :from => [:active]
  end
  def activate()
    
  end
  
  def self.valid_activation_string(activation_string)
    count(:conditions=>{:activation_number=>activation_string,:activation_status => 'not_active' })
  end
  
  protected

  def self.sha1
    Digest::SHA1.hexdigest(Time.now.to_s)
  end
    
  before_create :generate_activation_string
  
  def generate_activation_string
    write_attribute("activation_number", self.class.sha1)
  end
end
