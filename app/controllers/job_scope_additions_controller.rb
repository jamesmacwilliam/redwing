class JobScopeAdditionsController < ApplicationController
  before_filter :authenticate_user!
  in_place_edit_for :addition_task_record, :date_completed
  protect_from_forgery
  layout "application"
  load_and_authorize_resource
  
  EDIT_TEXT = "=>click to edit<="  
  
  
  def set_addition_task_record_date_completed
    @error = "*incorrect date format"
    render :text => EDIT_TEXT and return if params[:value] == ""
    milestone_record = AdditionTaskRecord.find(params[:id])
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
  
  def get_addition_task_record_date_completed
    milestone_record = AdditionTaskRecord.find(params[:id])
    if milestone_record.date_completed
    render :text => milestone_record.date_completed
    else
      render :text => EDIT_TEXT
    end
  end
  
  def set_milestone_records(scope_type)
    return unless scope_type and session[:job_id]
    recs = MilestoneTask.find_all_by_scope_type(scope_type)
    job = JobScopeAddition.find(session[:job_extra_id]) if JobScopeAddition.exists?(session[:job_extra_id])
    return unless job
    @records = AdditionTaskRecord.where(:jobs_id => job.id)
    if @records and @records.first
      scope_test = job.ScopeTypeID
      #need alert before this action!
      if scope_test == scope_type
        @records = order_rows_additional_scope(job.id)
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
        mr = AdditionTaskRecord.new(ins)
        mr.save!
        mid_arr << r.id
      end
    end

    @records = order_rows_additional_scope(job.id)
    
  end
  
  
  
  def store_scope
    session[:scope_type] = params[:scope_type] if request.xhr? && params[:scope_type]
    set_milestone_records(session[:scope_type])
    render :partial => "job_scope_additions/records"
  end    
  
  # GET /job_scope_additions
  # GET /job_scope_additions.xml
  def index
    @job = Job.find(params[:jid]) if params[:jid] and Job.exists?(params[:jid])
    redirect_to jobs_path unless @job
    @job = Job.find(params[:jid]) if params[:jid] and Job.exists?(params[:jid])
    redirect_to jobs_path unless @job
    @job_scope_additions = JobScopeAddition.find_all_by_jobs_id(@job.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_scope_additions }
    end
  end

  # GET /job_scope_additions/1
  # GET /job_scope_additions/1.xml
  def show
    @job_scope_addition = JobScopeAddition.find(params[:id])
    @job = Job.find(@job_scope_addition.jobs_id) if @job_scope_addition.jobs_id and Job.exists?(@job_scope_addition.jobs_id)
    redirect_to jobs_path unless @job
    @scope_type = ScopeType.find_all_by_ProjectTypeID(@job.ProjectTypeID)
    session[:job_extra_id] = params[:id]
    session[:scope_type] = @job_scope_addition.ScopeTypeID    
    set_milestone_records(@job_scope_addition.ScopeTypeID)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_scope_addition }
    end
  end

  # GET /job_scope_additions/new
  # GET /job_scope_additions/new.xml
  def new
    session[:scope_type] = nil
    @job_scope_addition = JobScopeAddition.new
    @job = Job.find(params[:jid]) if params[:jid] and Job.exists?(params[:jid])
    redirect_to jobs_path unless @job
    @scope_type = ScopeType.find_all_by_ProjectTypeID(@job.ProjectTypeID)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_scope_addition }
    end
  end

  # GET /job_scope_additions/1/edit
  def edit
    redirect_to :action => :show, :id => params[:id], :jid => params[:jid]
  end

  # POST /job_scope_additions
  # POST /job_scope_additions.xml
  def create
    @job_scope_addition = JobScopeAddition.new(params[:job_scope_addition])

    respond_to do |format|
      if @job_scope_addition.save
        format.html { redirect_to(:action => :show,:jid => @job_scope_addition.jobs_id, :notice => 'Extra Scope was successfully created.') }
        format.xml  { render :xml => @job_scope_addition, :status => :created, :location => @job_scope_addition }
      else
        format.html { redirect_to :action => "new", :jid => @job_scope_addition.jobs_id, :alert => "Failed to save" }
        format.xml  { render :xml => @job_scope_addition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_scope_additions/1
  # PUT /job_scope_additions/1.xml
  def update
    @job_scope_addition = JobScopeAddition.find(params[:id])

    respond_to do |format|
      if @job_scope_addition.update_attributes(params[:job_scope_addition])
        format.html { redirect_to(:action => :show, :jid => @job_scope_addition.jobs_id, :notice => 'Job scope addition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to :action => :show, :jid => @job_scope_addition.jobs_id, :alert => "Failed to save" }
        format.xml  { render :xml => @job_scope_addition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_scope_additions/1
  # DELETE /job_scope_additions/1.xml
  def destroy
    @job_scope_addition = JobScopeAddition.find(params[:id])
    jid = @job_scope_addition.jobs_id
    jsa_id = params[:id]
    recs = AdditionTaskRecord.find_all_by_jobs_id(jsa_id)
    delete_records(recs)
    @job_scope_addition.destroy

    respond_to do |format|
      format.html { redirect_to("#{job_scope_additions_url}?jid=#{jid}") }
      format.xml  { head :ok }
    end
  end
end
