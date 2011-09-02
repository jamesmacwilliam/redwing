class CarriersController < ApplicationController
  # GET /carriers
  # GET /carriers.xml
  def index
    @carriers = Carrier.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carriers }
    end
  end

  # GET /carriers/1
  # GET /carriers/1.xml
  def show
    @carrier = Carrier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carrier }
    end
  end

  # GET /carriers/new
  # GET /carriers/new.xml
  def new
    @carrier = Carrier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carrier }
    end
  end

  # GET /carriers/1/edit
  def edit
    @carrier = Carrier.find(params[:id])
  end

  # POST /carriers
  # POST /carriers.xml
  def create
    @carrier = Carrier.new(params[:carrier])

    respond_to do |format|
      if @carrier.save
        format.html { redirect_to(@carrier, :notice => 'Carrier was successfully created.') }
        format.xml  { render :xml => @carrier, :status => :created, :location => @carrier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carrier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carriers/1
  # PUT /carriers/1.xml
  def update
    @carrier = Carrier.find(params[:id])

    respond_to do |format|
      if @carrier.update_attributes(params[:carrier])
        format.html { redirect_to(@carrier, :notice => 'Carrier was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carrier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carriers/1
  # DELETE /carriers/1.xml
  def destroy
    @carrier = Carrier.find(params[:id])
    @carrier.destroy

    respond_to do |format|
      format.html { redirect_to(carriers_url) }
      format.xml  { head :ok }
    end
  end
end
