require 'icalendar'
class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.xml
  layout 'projs'
  def index
    @user=User.find(session[:user])
    @proj=Proj.find(params[:proj_id])
    @milestones = @proj.milestones.all
    @milestones_completed = @proj.milestones.list_of_completed
    @milestones_late= @proj.milestones.list_of_already_late
    @milestones_upcoming= @proj.milestones.list_of_upcoming
    @current="milestones"
    
    
    
		@cal = Icalendar::Calendar.new
    event = Icalendar::Event.new
    event.start = Date.today
    event.end = Date.today
    event.summary = "meeting"
    @cal.add event
    
       
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.xml
  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.xml
  def new
    @milestone = Milestone.new
    @current="milestones"
    @user=User.find(session[:user])
    @proj=Proj.find(params[:proj_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
  end

  # POST /milestones
  # POST /milestones.xml
  def create
    @milestone = Milestone.new(params[:milestone])
    @current="milestones"
    @user=User.find(session[:user])
    @proj=@milestone.proj
    respond_to do |format|
      if @milestone.save
        flash[:notice] = 'Milestone was successfully created.'
        format.html { redirect_to(proj_milestones_path(@proj)) }
        format.xml  { render :xml => @milestone, :status => :created, :location => @milestone }
      else
        format.html { redirect_to(proj_milestones_path(@proj)) }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.xml
  def update
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        flash[:notice] = 'Milestone was successfully updated.'
        format.html { redirect_to(@milestone) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.xml
  def destroy
    @milestone = Milestone.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to(milestones_url) }
      format.xml  { head :ok }
    end
  end
  
  def complete
    @milestone = Milestone.find(params[:id])
    @milestone.setcompleted
    @proj=@milestone.proj
    @user = User.find(session[:user])
    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        flash[:notice] = 'Milestone was successfully updated.'
        format.html { redirect_to(proj_milestones_path(@proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end
  def incomplete
    @milestone = Milestone.find(params[:id])
    @milestone.setnotcompleted
    @proj=@milestone.proj
    @user = User.find(session[:user])
    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        flash[:notice] = 'Milestone was successfully updated.'
        format.html { redirect_to(proj_milestones_path(@proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
end
