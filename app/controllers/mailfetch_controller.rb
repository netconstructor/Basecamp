class MailfetchController < ApplicationController
	def index
	    @incomingmailhandler = IncomingMailHandler.new

	    @fetcher = Fetcher.create({:type => :pop,
                             :receiver => incomingmailhandler,
                             :server => 'imap.gmail.com',
                             :username => 'naga.gangadhar@gmail.com',
                             :password => 'GodavarI'})

		@fetched= @fetcher.fetch

	    end
	
end
