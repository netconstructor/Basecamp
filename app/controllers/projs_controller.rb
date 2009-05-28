class ProjsController < ApplicationController
  # GET /projs
  # GET /projs.xml
  def index
    @projs = Proj.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projs }
    end
  end

  # GET /projs/1
  # GET /projs/1.xml
  def show
    @current="overview"
    @proj = Proj.find(params[:id])
    @proj_non_users=User.list_of_users_not_in_proj(@proj)
    @list_users = User.list_of_users
    @user = session[:user]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proj }
    end
  end
  
  def projs_messages_list
    @proj = Proj.find(params[:id])
  end

  # GET /projs/new
  # GET /projs/new.xml
  def new
    @proj = Proj.new()
    @user = session[:user] 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proj }
    end
  end

  # GET /projs/1/edit
  def edit
    @proj = Proj.find(params[:id])
  end

  # POST /projs
  # POST /projs.xml
  def create
    @proj = Proj.new(params[:proj])
    
    # respond_to do |format|
      if @proj.save
        flash[:notice] = 'Proj was successfully created.'
         redirect_to (:controller=> "users",  :action => "show" )
      else
        flash[:notice] = 'Error creating project due to the following errors'
        @proj.errors.each do |attrn, message|
            flash[:notice]+= '<li>'+attrn+' '+message+'</li>'
        end
        redirect_to (:action => "new" )
      end
    # end
  end

  # PUT /projs/1
  # PUT /projs/1.xml
  def update
    @proj = Proj.find(params[:id])

    respond_to do |format|
      if @proj.update_attributes(params[:proj])
        flash[:notice] = 'Proj was successfully updated.'
        format.html { redirect_to(@proj) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projs/1
  # DELETE /projs/1.xml
  def destroy
    @proj = Proj.find(params[:id])
    @proj.destroy

    respond_to do |format|
      format.html { redirect_to(projs_url) }
      format.xml  { head :ok }
    end
  end
end
