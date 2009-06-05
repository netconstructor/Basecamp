class UsersController < ApplicationController
   # before_filter :check_login, :only=>[:index]
   # before_filter :logged_out_user, :only=>[:index]
  # GET /users
  # GET /users.xml
  layout 'scaffold'
  def index1
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def install
   
  end

  def create_admin
	
     @user = User.new(params[:user])
     @user.username = "admin"
     @user.admin="admin"
     
     respond_to do |format|
      if @user.save
        flash[:notice] = 'Admin was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "install" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
	
  end



  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(session[:user])
    @current="dashboard"
    @PageTitle="Dashboard - "+@user.username
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def todo_list
    @current="todos"
    @user = User.find(session[:user])
    @PageTitle="To-Dos - "+@user.username
    @projects=@user.list_projects
    
  end
  
  def milestones
    @user = User.find(session[:user])
    @current="milestones"
    @milestones=Milestone.list_of_already_late
  end
  
  def tickets
    @user = User.find(session[:user])
    @current="tickets"
  end

  def index
    
  end
  
  def login
    @credentials=params[:user]
   @user = User.authenticate(@credentials[:username],@credentials[:password])
   if !@user.nil?
      session[:user]=@user.id
      redirect_to :action => "show"
      flash[:notice] =="logged in"
    else
      session[:user]=0
      flash[:notice] =="logged out"
      redirect_to :action => "index"
    end
    
  end
  
  def logout
    session[:user]=0
    redirect_to :action => "index"
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  def check_login
    if !session[:user].nil? && session[:user]!=0
      redirect_to :action => "show"
    end
  end
  def logged_out_user
    if !session[:user].nil? || session[:user]==0
      redirect_to :action => "index"
    end
  end
end
