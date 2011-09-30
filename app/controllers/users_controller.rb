class UsersController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery
  layout "application"
  before_filter :check_admin
  
  def check_admin
    redirect_to :root, :alert => "You are not authorized to edit user roles" and return unless current_user.roles.first and current_user.roles.first.name == "SuperAdmin"
  end

  def show 
    redirect_to :action => :index
  end  
  
  # GET /carriers
  # GET /carriers.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /carriers/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  # PUT /carriers/1
  # PUT /carriers/1.xml
  def update
    p = params[:roles_user]
    recs = RolesUser.where(:user_id => p[:user_id],:role_id => p[:role_id])
    if recs
      @user = recs.first
      @user.attributes = p
    end
    @user = RolesUser.new(p)
    respond_to do |format|
      if @user.save!
        format.html { redirect_to(:action => "edit", :id => p[:user_id] , :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to :action => "edit", :id => p[:user_id] }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end  

end