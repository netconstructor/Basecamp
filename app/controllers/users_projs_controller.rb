class UsersProjsController < ApplicationController
  # GET /users_projs
  # GET /users_projs.xml
  def index
    @users_projs = UsersProjs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users_projs }
    end
  end

  # GET /users_projs/1
  # GET /users_projs/1.xml
  def show
    @users_projs = UsersProjs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @users_projs }
    end
  end

  # GET /users_projs/new
  # GET /users_projs/new.xml
  def new
    @users_projs = UsersProjs.new()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @users_projs }
    end
  end

  # GET /users_projs/1/edit
  def edit
    @users_projs = UsersProjs.find(params[:id])
  end

  # POST /users_projs
  # POST /users_projs.xml
  def create
    @users_projs = UsersProj.new(params[:users_projs])

    # respond_to do |format|
      if @users_projs.save
        flash[:notice] = 'user was successfully added.'
        redirect_to (:controller=> "users",  :action => "show" )
        # format.html { redirect_to(@users_projs) }
        # format.xml  { render :xml => @users_projs, :status => :created, :location => @users_projs }
      else
        flash[:notice] = 'Error creating project due to the following errors'
        @users_projs.errors.each do |attrn, message|
            flash[:notice]+= '<li>'+attrn+' '+message+'</li>'
        end
        redirect_to (:controller=> "users",  :action => "show" )
        # format.html { render :action => "new" }
        # format.xml  { render :xml => @users_projs.errors, :status => :unprocessable_entity }
      end
    # end
  end

  # PUT /users_projs/1
  # PUT /users_projs/1.xml
  def update
    @users_projs = UsersProjs.find(params[:id])

    respond_to do |format|
      if @users_projs.update_attributes(params[:users_projs])
        flash[:notice] = 'UsersProjs was successfully updated.'
        format.html { redirect_to(@users_projs) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @users_projs.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users_projs/1
  # DELETE /users_projs/1.xml
  def destroy
    @users_projs = UsersProjs.find(params[:id])
    @users_projs.destroy

    respond_to do |format|
      format.html { redirect_to(users_projs_url) }
      format.xml  { head :ok }
    end
  end
end
