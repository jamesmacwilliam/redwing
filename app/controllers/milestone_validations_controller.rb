class MilestoneValidationsController < ApplicationController
  # GET /milestone_validations
  # GET /milestone_validations.xml
  def index
    @milestone_validations = MilestoneValidation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestone_validations }
    end
  end

  # GET /milestone_validations/1
  # GET /milestone_validations/1.xml
  def show
    @milestone_validation = MilestoneValidation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone_validation }
    end
  end

  # GET /milestone_validations/new
  # GET /milestone_validations/new.xml
  def new
    @milestone_validation = MilestoneValidation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone_validation }
    end
  end

  # GET /milestone_validations/1/edit
  def edit
    @milestone_validation = MilestoneValidation.find(params[:id])
  end

  # POST /milestone_validations
  # POST /milestone_validations.xml
  def create
    @milestone_validation = MilestoneValidation.new(params[:milestone_validation])

    respond_to do |format|
      if @milestone_validation.save
        format.html { redirect_to(@milestone_validation, :notice => 'Milestone validation was successfully created.') }
        format.xml  { render :xml => @milestone_validation, :status => :created, :location => @milestone_validation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @milestone_validation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestone_validations/1
  # PUT /milestone_validations/1.xml
  def update
    @milestone_validation = MilestoneValidation.find(params[:id])

    respond_to do |format|
      if @milestone_validation.update_attributes(params[:milestone_validation])
        format.html { redirect_to(@milestone_validation, :notice => 'Milestone validation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone_validation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone_validations/1
  # DELETE /milestone_validations/1.xml
  def destroy
    @milestone_validation = MilestoneValidation.find(params[:id])
    @milestone_validation.destroy

    respond_to do |format|
      format.html { redirect_to(milestone_validations_url) }
      format.xml  { head :ok }
    end
  end
end
