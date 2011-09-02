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
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end 
  end
end