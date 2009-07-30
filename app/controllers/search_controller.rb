class SearchController < ApplicationController
   def index
     respond_to do |format|                                                  
      format.html # index.html.erb                                          
      format.xml  { render :xml => @searchresults }                                 
     end
   end
end
