class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  layout 'projs'
  def index
    @proj=Proj.find(params[:proj_id])
    @messages = @proj.messages.all
    @current="messages"
    @user=User.find(User.find(session[:user]))
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])
    @proj=Proj.find(params[:proj_id])
    @current="messages"
    @user=User.find(User.find(session[:user]))
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new
    @proj=Proj.find(params[:proj_id])
    @current="messages"
    @user=User.find(session[:user])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @proj=Proj.find(params[:proj_id])
    @current="messages"
    @user=User.find(session[:user])
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    parameters=params[:message]
    @proj=Proj.find(parameters[:proj_id])
    @current="messages"
    @user=User.find(session[:user])
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        # redirect_to (:controller=> "projs",  :action => "show", :id=> parameters[:proj_id] )
        format.html { redirect_to(proj_messages_path(@proj)) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])
    parameters=params[:message]
    @proj=Proj.find(parameters[:proj_id])
    @current="messages"
    @user=User.find(session[:user])
    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to(proj_messages_path(@proj)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @proj=Proj.find(params[:proj_id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(proj_messages_path(@proj)) }
      format.xml  { head :ok }
    end
  end
end
