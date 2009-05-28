class ActivationsController < ApplicationController
  # GET /activations
  # GET /activations.xml
  def index1
    @activations = Activation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activations }
    end
  end

  # GET /activations/1
  # GET /activations/1.xml
  def show
    @activation = Activation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activation }
    end
  end

  # GET /activations/new
  # GET /activations/new.xml
  def new
    @activation = Activation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activation }
    end
  end

  # GET /activations/1/edit
  def edit
    @activation = Activation.find(params[:id])
  end

  # POST /activations
  # POST /activations.xml
  def create
    @activation = Activation.new(params[:activation])

    # respond_to do |format|
      if @activation.save
        flash[:notice] = 'Activation was successfully created.'
        redirect_to :controller=> "users", :action =>"show"
        # format.html { redirect_to(@activation) }
        # format.xml  { render :xml => @activation, :status => :created, :location => @activation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activation.errors, :status => :unprocessable_entity }
      end
    # end
  end
  
  def index
      @activation_string=params[:activation_string]
      if Activation.valid_activation_string(@activation_string)==0
        redirect_to :controller => "invalid_activation", :action=> "index" 
       else
        @activation=Activation.find_by_activation_number(@activation_string)
      end
  end
  
  def activate
    @user_params=params[:user]
    @activation=params[:activation]
    @activation_string=@activation[:activation_number]
    @activation=Activation.find_by_activation_number(@activation_string)
    if @user_params[:password]!="" && @user_params[:password]==params[:confirm_password]
        @user=User.new(params[:user])
        
        Activation.transaction do
          @user.email_address=@activation.email_address
          @user.save! 
          @activation.user_id=@user.id
          @activation.active
          @activation.save!
        end  
        session[:user] = @user
        redirect_to :controller => "users", :action=> "index" 
    else
        
        flash[:notice] = 'Passwrods did not match.'
        
        render :template => "activations/index"
    end
  end
  
  def invalid_activation
    
  end

  # PUT /activations/1
  # PUT /activations/1.xml
  def update
    @activation = Activation.find(params[:id])

    respond_to do |format|
      if @activation.update_attributes(params[:activation])
        flash[:notice] = 'Activation was successfully updated.'
        format.html { redirect_to(@activation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activations/1
  # DELETE /activations/1.xml
  def destroy
    @activation = Activation.find(params[:id])
    @activation.destroy

    respond_to do |format|
      format.html { redirect_to(activations_url) }
      format.xml  { head :ok }
    end
  end
end
