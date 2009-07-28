class UserNotification < ActionMailer::Base
  def todo_notify(todo)
         recipients activation.email_address
         from "Basecamp <notifications@pagalguy.com>"
         subject "You have been assigned a todo"
         sent_on Time.now
         body :todo => todo
  end


  
end
