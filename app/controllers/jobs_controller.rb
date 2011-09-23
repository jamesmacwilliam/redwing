class JobsController < ActionController::Base
  before_filter :authenticate_user!, :except => [:index]
  protect_from_forgery
  layout "application"
  #test
  
  def delete_records(recs)
    recs.each do |r|
      r.destroy
    end
  end
  
  def set_milestone_records(scope_type)
    return unless scope_type
    recs = MilestoneTask.find_all_by_scope_type(scope_type)
    @records = MilestoneRecord.find_all_by_jobs_id(@job.id)
    if @records and @records.first and @records.first
      scope_test = @records.first.milestone_task.scope_type
      
      #need alert before this action!
      if scope_test == scope_type
        return
      else  
        delete_records(@records)
      end   
    end
    mid_arr = []
    recs.each do |r|
      
      ins = {
        :milestone_tasks_id => r.id,
        :jobs_id => @job.id
      }
      mr = MilestoneRecord.new(ins)
      mr.save!
      mid_arr << r.id
    end
    @records = MilestoneRecord.find_by_milestone_tasks_id(mid_arr)
  end
  
  def store_scope
    session[:scope_type] = params[:scope_store] if request.xhr? && params[:scope_type]
    set_milestone_records(session[:scope_type])
    render :partial => "jobs/records"
  end  
  
  def index
    @jobs = Job.all
  end
  
  
  def new
    session[:scope_type] = nil
    @job = Job.new
    @jobs.CustomerID = session[:CustomerID] if session[:CustomerID]
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
        format.html { render :action => "edit" }
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
    set_milestone_records(@scope_type.first.id) if @scope_type.first
  end
  
  def edit
    redirect_to :action => :show
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