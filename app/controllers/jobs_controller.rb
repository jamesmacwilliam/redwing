class JobsController < ApplicationController
  before_filter :authenticate_user!
  in_place_edit_for :milestone_record, :date_completed
  protect_from_forgery
  layout "application"
  load_and_authorize_resource
  
  EDIT_TEXT = "click to edit"
  #test
   
  
  def set_milestone_record_date_completed
    @error = "*incorrect date format"
    render :text => EDIT_TEXT and return if params[:value] == ""
    milestone_record = MilestoneRecord.find(params[:id])
    old_value = milestone_record.date_completed
    milestone_record.date_completed = params[:value]
    if not params[:value] == EDIT_TEXT and milestone_record.valid?
      milestone_record.save!
      @error = nil
      render :text => params[:value]
    elsif old_value
      render :text => old_value  
    else
      render :text => EDIT_TEXT
    end  
  end
  
  
  def get_milestone_record_date_completed
    milestone_record = MilestoneRecord.find(params[:id])
    if milestone_record.date_completed
    render :text => milestone_record.date_completed
    else
      render :text => EDIT_TEXT
    end
  end
  
  def set_milestone_records(scope_type)
    return unless scope_type and session[:job_id]
    recs = MilestoneTask.find_all_by_scope_type(scope_type)
    job = Job.find(session[:job_id])
    return unless job
    @records = MilestoneRecord.where(:jobs_id => job.id)
    if @records and @records.first
      scope_test = job.ScopeTypeID
      #need alert before this action!
      if scope_test == scope_type
        @records = order_rows(job.id)
        return
      else  
        delete_records(@records)
      end   
    end
    mid_arr = []
    if job and job.id
      
      recs.each do |r|
        
        ins = {
          :milestone_tasks_id => r.id,
          :jobs_id => job.id,
          :date_completed => nil
        }
        mr = MilestoneRecord.new(ins)
        mr.save!
        mid_arr << r.id
      end
    end

    @records = order_rows(job.id)
    
  end
  
  
  
  def store_scope
    session[:scope_type] = params[:scope_type] if request.xhr? && params[:scope_type]
    set_milestone_records(session[:scope_type])
    render :partial => "jobs/records"
  end  
  
  def index
    @jobs = Job.all
  end
  
  
  def new
    session[:scope_type] = nil
    session[:job_id] = nil
    @job = Job.new
    @job.CustomerID = session[:CustomerID] if session[:CustomerID]
    @customer = Customer.order(:name => 'desc')
    @carrier = Carrier.order(:name => 'desc')
    @work_site = WorkSite.order(:name => 'desc') 
    @project_type = ProjectType.order(:name => 'desc')  
    if @project_type.first
      @scope_type = ScopeType.find_all_by_ProjectTypeID(@project_type.first.id)
    else
      @scope_type = ScopeType.order(:name => 'desc')
    end  

    set_milestone_records(@scope_type.first.id) if @scope_type.first
    session[:scope_type] = @scope_type.first.id if @scope_type.first
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end 
  end
  
  def create

    @job = Job.new(job_arr(params[:job],session[:scope_type]))
    respond_to do |format|
      if @job.save
        format.html { redirect_to(@job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html {
           redirect_to :action => :new, :alert => 'Failed to Create new Job' 
           }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end 
  
  def update
    
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.update_attributes(job_arr(params[:job],session[:scope_type]))
        format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to :action => "show", :id => params[:id], :alert => "Please ensure that all fields are valid and try again." }
        format.xml  { render :xml => @milestone_validation.errors, :status => :unprocessable_entity }
      end
    end
  end 
  
  def job_arr(arr,scope_type)
    arr[:ScopeTypeID] = scope_type
    arr
  end
  
  
  
  def show 
    
    @job = Job.find(params[:id])
    @customer = Customer.order(:name => 'desc')
    @carrier = Carrier.order(:name => 'desc')
    @work_site = WorkSite.order(:name => 'desc') 
    @project_type = ProjectType.order(:name => 'desc')  
    @scope_type = ScopeType.find_all_by_ProjectTypeID(@job.ProjectTypeID)
    session[:scope_type] = @job.ScopeTypeID
    session[:job_id] = @job.id
    set_milestone_records(@scope_type.first.id) if @scope_type.first
    
  end
  
  def edit
    redirect_to :action => :show, :id => params[:id]
  end
  
  def get_scope
    if request.xhr? && params[:project_type]
      @scope_type = ScopeType.find_all_by_ProjectTypeID(params[:project_type])
      if @scope_type and @scope_type.first
        session[:scope_type] = @scope_type.first.id
      else
        session[:scope_type] = nil
      end
      render :partial => "jobs/scope_type"
    end
  end
  
end