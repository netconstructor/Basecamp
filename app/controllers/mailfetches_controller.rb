class MailfetchesController < ApplicationController
  # GET /mailfetches
  # GET /mailfetches.xml
  def index
#    @mailfetches = Mailfetch.all
            @incomingmailhandler = IncomingMailHandler.new

            @fetcher = Fetcher.create({:type => :pop,
                             :receiver => incomingmailhandler,
                             :server => 'imap.gmail.com',
                             :username => 'naga.gangadhar@gmail.com',
                             :password => 'GodavarI'})

                @fetched= @fetcher.fetch


 #   respond_to do |format|
  #    format.html # index.html.erb
   #   format.xml  { render :xml => @mailfetches }
    #end
  end

  # GET /mailfetches/1
  # GET /mailfetches/1.xml
  def show
    @mailfetch = Mailfetch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mailfetch }
    end
  end

  # GET /mailfetches/new
  # GET /mailfetches/new.xml
  def new
    @mailfetch = Mailfetch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mailfetch }
    end
  end

  # GET /mailfetches/1/edit
  def edit
    @mailfetch = Mailfetch.find(params[:id])
  end

  # POST /mailfetches
  # POST /mailfetches.xml
  def create
    @mailfetch = Mailfetch.new(params[:mailfetch])

    respond_to do |format|
      if @mailfetch.save
        flash[:notice] = 'Mailfetch was successfully created.'
        format.html { redirect_to(@mailfetch) }
        format.xml  { render :xml => @mailfetch, :status => :created, :location => @mailfetch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mailfetch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mailfetches/1
  # PUT /mailfetches/1.xml
  def update
    @mailfetch = Mailfetch.find(params[:id])

    respond_to do |format|
      if @mailfetch.update_attributes(params[:mailfetch])
        flash[:notice] = 'Mailfetch was successfully updated.'
        format.html { redirect_to(@mailfetch) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mailfetch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mailfetches/1
  # DELETE /mailfetches/1.xml
  def destroy
    @mailfetch = Mailfetch.find(params[:id])
    @mailfetch.destroy

    respond_to do |format|
      format.html { redirect_to(mailfetches_url) }
      format.xml  { head :ok }
    end
  end
end
