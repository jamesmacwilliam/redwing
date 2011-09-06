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
  

end