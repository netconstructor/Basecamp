class TodosController < ApplicationController
  # GET /todos
  # GET /todos.xml
  
  
  
  layout 'scaffold'
  def index
    @todos = Todo.all
    @user = User.find(session[:user])
    @current="todos"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.xml
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/new
  # GET /todos/new.xml
  def new
    @todo = Todo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @todo = Todo.find(params[:id])
  end

  # POST /todos
  # POST /todos.xml
  def create
    @todo = Todo.new(params[:todo])
    @proj=@todo.proj
    @user = User.find(session[:user])
    respond_to do |format|
      if @todo.save
        UserNotification.deliver_todo_notification(@todo)        
        flash[:notice] = 'Todo was successfully created.'
        format.html { redirect_to(proj_todolists_path(@proj)) }
        format.xml  { render :xml => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.xml
  def update
    @todo = Todo.find(params[:id])
    parameters=params[:todo]
    @proj=Proj.find(parameters[:proj_id])
    @user = User.find(session[:user])
    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'Todo was successfully updated.'
        format.html { redirect_to(proj_todolists_path(@proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.setcompleted
    @proj=@todo.todolist.proj
    @user = User.find(session[:user])
    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'Todo was successfully updated.'
        format.html { redirect_to(proj_todolists_path(@proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end
  def incomplete
    @todo = Todo.find(params[:id])
    @todo.setnotcompleted
    @proj=@todo.todolist.proj
    @user = User.find(session[:user])
    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'Todo was successfully updated.'
        format.html { redirect_to(proj_todolists_path(@proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /todos/1
  # DELETE /todos/1.xml
  def destroy
    @todo = Todo.find(params[:id])
    @todolist = Todolist.find(params[:todolist_id])
    @proj=@todolist.proj
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(proj_todolists_path(@proj)) }
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
