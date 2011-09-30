class AdditionTaskRecordsController < ApplicationController
  # GET /addition_task_records
  # GET /addition_task_records.xml
  def index
    @addition_task_records = AdditionTaskRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addition_task_records }
    end
  end

  # GET /addition_task_records/1
  # GET /addition_task_records/1.xml
  def show
    @addition_task_record = AdditionTaskRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @addition_task_record }
    end
  end

  # GET /addition_task_records/new
  # GET /addition_task_records/new.xml
  def new
    @addition_task_record = AdditionTaskRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @addition_task_record }
    end
  end

  # GET /addition_task_records/1/edit
  def edit
    @addition_task_record = AdditionTaskRecord.find(params[:id])
  end

  # POST /addition_task_records
  # POST /addition_task_records.xml
  def create
    @addition_task_record = AdditionTaskRecord.new(params[:addition_task_record])

    respond_to do |format|
      if @addition_task_record.save
        format.html { redirect_to(@addition_task_record, :notice => 'Addition task record was successfully created.') }
        format.xml  { render :xml => @addition_task_record, :status => :created, :location => @addition_task_record }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @addition_task_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addition_task_records/1
  # PUT /addition_task_records/1.xml
  def update
    @addition_task_record = AdditionTaskRecord.find(params[:id])

    respond_to do |format|
      if @addition_task_record.update_attributes(params[:addition_task_record])
        format.html { redirect_to(@addition_task_record, :notice => 'Addition task record was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @addition_task_record.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addition_task_records/1
  # DELETE /addition_task_records/1.xml
  def destroy
    @addition_task_record = AdditionTaskRecord.find(params[:id])
    @addition_task_record.destroy

    respond_to do |format|
      format.html { redirect_to(addition_task_records_url) }
      format.xml  { head :ok }
    end
  end
end
