class Ticket < ActiveRecord::Base
	belongs_to :user
	belongs_to :milestone
	belongs_to :proj
	
	def status_list
	    return ["New","Open","Resolved","Invalid"]	
	end	
	def created_by_user
	   return User.find(self.created_by).username
	end
end
