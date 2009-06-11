class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
before_filter :isloggedout
  layout 'projs'
  def index
    @user=User.find(session[:user])
    @proj=Proj.find(params[:proj_id])
    @tickets = @proj.tickets.all
    @current = "tickets"


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])
    @user=User.find(session[:user])
    @proj=Proj.find(params[:proj_id])
    @current = "tickets"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @user=User.find(session[:user])
    @proj=Proj.find(params[:proj_id])
    @milestones=@proj.milestones.all
    @ticket = Ticket.new
    @current = "tickets"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @user=User.find(session[:user])
    @proj=Proj.find(params[:proj_id])
    @milestones=@proj.milestones.all
    @current = "tickets"
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @ticket = Ticket.new(params[:ticket])
    @proj=@ticket.proj
    
    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Ticket was successfully created.'
        format.html { redirect_to(proj_tickets_path(@proj)) }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])
    @proj=@ticket.proj
    @user=User.find(session[:user])
    @current = "tickets"
    
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { redirect_to(proj_ticket_path(@proj,@ticket)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @proj=@ticket.proj

    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(proj_tickets_path(@proj)) }
      format.xml  { head :ok }
    end
  end

private

def isloggedout
        if session[:user].blank? || session[:user]==0
                redirect_to :controller => "users", :action => "index"
        end
end

end
