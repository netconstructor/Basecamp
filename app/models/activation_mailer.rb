class ActivationMailer < Notifier
    def user_activation(options)
       self.generic_options(options)
    end
end
