class TodolistsController < ApplicationController
  # GET /todolists
  # GET /todolists.xml
  
  layout 'projs'
  def index
    @list_users = User.list_of_users
    @proj=Proj.find(params[:proj_id])
    @todolists = @proj.todolists.all
    @current="todos"
    @user=User.find(session[:user])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todolists }
    end
  end

  # GET /todolists/1
  # GET /todolists/1.xml
  def show
    @list_users = User.list_of_users
    @todolist = Todolist.find(params[:id])
    @proj=Proj.find(params[:proj_id])
    @current="todos"
    @user=User.find(session[:user])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todolist }
    end
  end

  # GET /todolists/new
  # GET /todolists/new.xml
  def new
    @todolist = Todolist.new
    @proj=Proj.find(params[:proj_id])
    @current="todos"
    @user=User.find(session[:user])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todolist }
    end
  end

  # GET /todolists/1/edit
  def edit
    @proj=Proj.find(params[:proj_id])
    @current="todos"
    @user=User.find(session[:user])
    @todolist = Todolist.find(params[:id])
  end

  # POST /todolists
  # POST /todolists.xml
  def create
    @todolist = Todolist.new(params[:todolist])
    @proj=Proj.find(params[:proj_id])
    @user=User.find(session[:user])
    respond_to do |format|
      if @todolist.save
        flash[:notice] = 'Todolist was successfully created.'
        format.html { redirect_to(proj_todolists_path(@proj)) }
        format.xml  { render :xml => @todolist, :status => :created, :location => @todolist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todolist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todolists/1
  # PUT /todolists/1.xml
  def update
    @todolist = Todolist.find(params[:id])
    @proj=@todolist.proj
    @user=User.find(session[:user])
    respond_to do |format|
      if @todolist.update_attributes(params[:todolist])
        flash[:notice] = 'Todolist was successfully updated.'
        format.html { redirect_to(proj_todolists_path(@todolist.proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todolist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.xml
  def destroy
    @todolist = Todolist.find(params[:id])
    @todolist.destroy

    respond_to do |format|
      format.html { redirect_to(proj_todolists_path(@todolist.proj)) }
      format.xml  { head :ok }
    end
  end
  private
  def check_login
    if !session[:user].nil? && session[:user]!=0
      redirect_to :action => "show" ,:controller => "users"
    end
  end
  def logged_out_user
    if session[:user].nil? || session[:user]==0
      redirect_to :action => "index", :controller => "users"
    end
  end
end
