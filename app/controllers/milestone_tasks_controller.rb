class MilestoneTasksController < ApplicationController
  # GET /milestone_tasks
  # GET /milestone_tasks.xml
  def index
    @milestone_tasks = MilestoneTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestone_tasks }
    end
  end

  # GET /milestone_tasks/1
  # GET /milestone_tasks/1.xml
  def show
    @milestone_task = MilestoneTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone_task }
    end
  end

  # GET /milestone_tasks/new
  # GET /milestone_tasks/new.xml
  def new
    @milestone_task = MilestoneTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone_task }
    end
  end

  # GET /milestone_tasks/1/edit
  def edit
    @milestone_task = MilestoneTask.find(params[:id])
  end

  # POST /milestone_tasks
  # POST /milestone_tasks.xml
  def create
    @milestone_task = MilestoneTask.new(params[:milestone_task])

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
      if @milestone_task.update_attributes(params[:milestone_task])
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
