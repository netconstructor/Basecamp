class ActivationMailer < ActionMailer::Base 
    def user_activation(activation)
         recipients activation.email_address
         from "Basecamp <notifications@pagalguy.com>"
         subject "Basecamp Activation Link"  
         sent_on Time.now 
         body :activation => activation 
    end
end
