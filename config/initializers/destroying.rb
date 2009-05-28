class ActiveRecord::Base
  def destroy
    self.deleted=true
    self.save
  end
end