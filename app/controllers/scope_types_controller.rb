class ScopeTypesController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery
  layout "application"
  load_and_authorize_resource
  
  # GET /scope_types
  # GET /scope_types.xml
  def index
    @scope_types = ScopeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scope_types }
    end
  end

  # GET /scope_types/1
  # GET /scope_types/1.xml
  def show
    redirect_to :action => :index
  end

  # GET /scope_types/new
  # GET /scope_types/new.xml
  def new
    @scope_type = ScopeType.new
    @project_type = ProjectType.order(:name => 'desc')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scope_type }
    end
  end

  # GET /scope_types/1/edit
  def edit
    @scope_type = ScopeType.find(params[:id])
    @project_type = ProjectType.order(:name => 'desc')
  end

  # POST /scope_types
  # POST /scope_types.xml
  def create
    @scope_type = ScopeType.new(params[:scope_type])
    @project_type = ProjectType.order(:name => 'desc')
    respond_to do |format|
      if @scope_type.save
        format.html { redirect_to(@scope_type, :notice => 'Scope type was successfully created.') }
        format.xml  { render :xml => @scope_type, :status => :created, :location => @scope_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scope_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scope_types/1
  # PUT /scope_types/1.xml
  def update
    @scope_type = ScopeType.find(params[:id])

    respond_to do |format|
      if @scope_type.update_attributes(params[:scope_type])
        format.html { redirect_to(@scope_type, :notice => 'Scope type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scope_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scope_types/1
  # DELETE /scope_types/1.xml
  def destroy
    @scope_type = ScopeType.find(params[:id])
    @scope_type.destroy

    respond_to do |format|
      format.html { redirect_to(scope_types_url) }
      format.xml  { head :ok }
    end
  end
end
