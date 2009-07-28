class UserNotification < ActiveRecord::Base

  def todo_notify(options)
       self.generic_options(options)
  end
  
end
