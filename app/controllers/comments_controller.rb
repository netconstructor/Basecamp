class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  before_filter :check_login
  before_filter :logged_out_user
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    @message=@comment.message
    @proj=@message.proj
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(proj_message_path(@proj,@message)) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        flash[:notice] = 'Error creating project due to the following errors'
        @comment.errors.each do |attrn, message|
            flash[:notice]+= '<li style="color:red">'+attrn+' '+message+'</li>'
        end
        format.html { redirect_to(proj_message_path(@proj,@message)) }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
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
