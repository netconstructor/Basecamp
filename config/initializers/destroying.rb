class ActiveRecord::Base
  default_scope :conditions => { :removed => false}
  def destroy
    self.removed=true
    self.save
  end
end