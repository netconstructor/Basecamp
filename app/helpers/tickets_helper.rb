module TicketsHelper
	def status_msg(status)
	   case status
	     when "New"
	       return "created by"
	     else
	       return "updated by"
	   end
	end
end
