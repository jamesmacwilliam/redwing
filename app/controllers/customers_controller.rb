class CustomersController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery
  layout "application"
  
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end



  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @customer }
    end
  end
  
  def show 
    redirect_to :action => :index
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to(@customer, :notice => 'Customer was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end


end
