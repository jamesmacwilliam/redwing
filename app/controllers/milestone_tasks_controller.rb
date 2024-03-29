class MilestoneTasksController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery
  layout "application"
  load_and_authorize_resource
  
  # GET /milestone_tasks
  # GET /milestone_tasks.xml
  def index
    session[:parent_milestone] = nil
    @milestone_tasks = MilestoneTask.all

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestone_tasks }
    end
  end

  # GET /milestone_tasks/1
  # GET /milestone_tasks/1.xml
  def show
    redirect_to :action => :index
  end

  # GET /milestone_tasks/new
  # GET /milestone_tasks/new.xml
  def new
    session[:parent_milestone] = nil
    @milestone_task = MilestoneTask.new
    @scope_type = ScopeType.order(:name => 'desc')
    @milestone_validation = MilestoneValidation.order(:name => 'desc')
    if @scope_type.first    
      @parent_task = MilestoneTask.find_all_by_scope_type(@scope_type.first.id) 
    else
      @parent_task = MilestoneTask.all
    end    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone_task }
    end
  end
  
  def set_parent_task
    @parent_task = MilestoneTask.find_all_by_scope_type(params[:parent_task])  if request.xhr? && params[:parent_task]
    render :partial => "milestone_tasks/parent_task"
  end

  def store_parent_task
    session[:parent_milestone] = params[:parent_milestone] if request.xhr? && params[:parent_milestone]
    render :partial => "milestone_tasks/blank"
  end
  
  # GET /milestone_tasks/1/edit
  def edit
    session[:parent_milestone] = nil
    @milestone_task = MilestoneTask.find(params[:id])
    @scope_type = ScopeType.order(:name => 'desc')
    @milestone_validation = MilestoneValidation.order(:name => 'desc')
    if @scope_type.first    
      @parent_task = MilestoneTask.find_all_by_scope_type(@milestone_task.scope_type.id) 
    else
      @parent_task = MilestoneTask.all
    end    
  end

  # POST /milestone_tasks
  # POST /milestone_tasks.xml
  
  def milestone_task_arr(arr,parent_milestone)
    arr[:ParentMilestoneTaskID] = parent_milestone
    arr
  end
  
  def create
    @milestone_task = MilestoneTask.new(milestone_task_arr(params[:milestone_task],session[:parent_milestone]))

    respond_to do |format|
      if @milestone_task.save
        format.html { redirect_to(@milestone_task, :notice => 'Milestone task was successfully created.') }
        format.xml  { render :xml => @milestone_task, :status => :created, :location => @milestone_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @milestone_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestone_tasks/1
  # PUT /milestone_tasks/1.xml
  def update
    @milestone_task = MilestoneTask.find(params[:id])
    
    respond_to do |format|
      if @milestone_task.update_attributes(milestone_task_arr(params[:milestone_task],session[:parent_milestone]))
        format.html { redirect_to(@milestone_task, :notice => 'Milestone task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone_tasks/1
  # DELETE /milestone_tasks/1.xml
  def destroy
    @milestone_task = MilestoneTask.find(params[:id])
    @milestone_task.destroy

    respond_to do |format|
      format.html { redirect_to(milestone_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
