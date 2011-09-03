class HomeController < ActionController::Base
  before_filter :authenticate_user!, :except => [:index]
  protect_from_forgery
  layout "application"
  #test
  
  def index
    
  end
  
  def user_portal
    email = current_user.email
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
  
  def get_scope
    is_render = false
    if request.xhr? && params[:project_type]
      @scope_type = ScopeType.find_all_by_ProjectTypeID(params[:project_type])
      if @scope_type
        is_render = true
        render :partial => "home/scope_type"
      end 
    end
    if ! is_render #render using the previous or restaurant zip
      raise "false"
    end
  end
end