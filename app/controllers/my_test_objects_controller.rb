class MyTestObjectsController < ApplicationController
    before_filter :authenticate_user!, :except => [:index]
    check_authorization :except => [:index]
  # GET /my_test_objects
  # GET /my_test_objects.xml
  def index
    @my_test_objects = MyTestObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @my_test_objects }
    end
  end

  # GET /my_test_objects/1
  # GET /my_test_objects/1.xml
  def show
    @my_test_object = MyTestObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @my_test_object }
    end
  end

  # GET /my_test_objects/new
  # GET /my_test_objects/new.xml
  def new
    @my_test_object = MyTestObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @my_test_object }
    end
  end

  # GET /my_test_objects/1/edit
  def edit
    @my_test_object = MyTestObject.find(params[:id])
  end

  # POST /my_test_objects
  # POST /my_test_objects.xml
  def create
    @my_test_object = MyTestObject.new(params[:my_test_object])

    respond_to do |format|
      if @my_test_object.save
        format.html { redirect_to(@my_test_object, :notice => 'My test object was successfully created.') }
        format.xml  { render :xml => @my_test_object, :status => :created, :location => @my_test_object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @my_test_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /my_test_objects/1
  # PUT /my_test_objects/1.xml
  def update
    @my_test_object = MyTestObject.find(params[:id])

    respond_to do |format|
      if @my_test_object.update_attributes(params[:my_test_object])
        format.html { redirect_to(@my_test_object, :notice => 'My test object was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @my_test_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_test_objects/1
  # DELETE /my_test_objects/1.xml
  def destroy
    @my_test_object = MyTestObject.find(params[:id])
    @my_test_object.destroy

    respond_to do |format|
      format.html { redirect_to(my_test_objects_url) }
      format.xml  { head :ok }
    end
  end
end
