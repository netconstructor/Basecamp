class UserNotification < ActionMailer::Base
  def todo_notify(todo)
         recipients todo.user.email_address
         from "Basecamp <notifications@pagalguy.com>"
         subject "You have been assigned a todo"
         sent_on Time.now
         body :todo => todo
  end

  def user_added_to_project_notify(project)
         recipients project.user.email_address
         from "Basecamp <notifications@pagalguy.com>"
         subject "You have been added to the project"
         sent_on Time.now
         body :project => project
  end


  
end
