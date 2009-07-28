class ActivationMailer < ActionMailer::Base 
    def user_activation(options)
         recipients options[:email_address]
         from "Basecamp <notifications@example.com>"
         subject "Basecamp Activation Link"  
         sent_on Time.now 
         body {} 
    end
end
