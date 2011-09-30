class MilestoneRecordsController < ApplicationController
  load_and_authorize_resource
  # GET /milestone_records
  # GET /milestone_records.xml
  def index
    @milestone_records = MilestoneRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestone_records }
    end
  end

  # GET /milestone_records/1
  # GET /milestone_records/1.xml
  def show
    @milestone_record = MilestoneRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone_record }
    end
  end

  # GET /milestone_records/new
  # GET /milestone_records/new.xml
  def new
    @milestone_record = MilestoneRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone_record }
    end
  end

  # GET /milestone_records/1/edit
  def edit
    @milestone_record = MilestoneRecord.find(params[:id])
  end

  # POST /milestone_records
  # POST /milestone_records.xml
  def create
    @milestone_record = MilestoneRecord.new(params[:milestone_record])

    respond_to do |format|
      if @milestone_record.save
        format.html { redirect_to(@milestone_record, :notice => 'Milestone record was successfully created.') }
        format.xml  { render :xml => @milestone_record, :status => :created, :location => @milestone_record }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @milestone_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestone_records/1
  # PUT /milestone_records/1.xml
  def update
    @milestone_record = MilestoneRecord.find(params[:id])

    respond_to do |format|
      if @milestone_record.update_attributes(params[:milestone_record])
        format.html { redirect_to(@milestone_record, :notice => 'Milestone record was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone_records/1
  # DELETE /milestone_records/1.xml
  def destroy
    @milestone_record = MilestoneRecord.find(params[:id])
    @milestone_record.destroy

    respond_to do |format|
      format.html { redirect_to(milestone_records_url) }
      format.xml  { head :ok }
    end
  end
end
