class JobsController < ActionController::Base
  before_filter :authenticate_user!, :except => [:index]
  protect_from_forgery
  layout "application"
  #test
  
  def index
    @jobs = Job.all
  end
  
  
  def new
    @job = Job.new
    @jobs.CustomerID = session[:CustomerID] if session[:CustomerID]
    @customer = Customer.order(:name => 'desc')
    @carrier = Carrier.order(:name => 'desc')
    @work_site = WorkSite.order(:name => 'desc') 
    @project_type = ProjectType.order(:name => 'desc')  
    @scope_type = ScopeType.find_all_by_ProjectTypeID(@project_type.first.id)

    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end 
  end
  
  def create
    @job = Job.new(params[:job])
    raise params[:job].inspect
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
  
  def show 
    redirect_to :action => :index
  end
  
  def get_scope
    is_render = false
    if request.xhr? && params[:project_type]
      @scope_type = ScopeType.find_all_by_ProjectTypeID(params[:project_type])
      if @scope_type
        is_render = true
        render :partial => "jobs/scope_type"
      end 
    end
    if ! is_render #render using the previous or restaurant zip
      
    end
  end
end