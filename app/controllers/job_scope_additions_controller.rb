class JobScopeAdditionsController < ApplicationController
  # GET /job_scope_additions
  # GET /job_scope_additions.xml
  def index
    @job_scope_additions = JobScopeAddition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_scope_additions }
    end
  end

  # GET /job_scope_additions/1
  # GET /job_scope_additions/1.xml
  def show
    @job_scope_addition = JobScopeAddition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_scope_addition }
    end
  end

  # GET /job_scope_additions/new
  # GET /job_scope_additions/new.xml
  def new
    @job_scope_addition = JobScopeAddition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_scope_addition }
    end
  end

  # GET /job_scope_additions/1/edit
  def edit
    @job_scope_addition = JobScopeAddition.find(params[:id])
  end

  # POST /job_scope_additions
  # POST /job_scope_additions.xml
  def create
    @job_scope_addition = JobScopeAddition.new(params[:job_scope_addition])

    respond_to do |format|
      if @job_scope_addition.save
        format.html { redirect_to(@job_scope_addition, :notice => 'Job scope addition was successfully created.') }
        format.xml  { render :xml => @job_scope_addition, :status => :created, :location => @job_scope_addition }
      else
        format.html { render :action => "new" }
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
        format.html { redirect_to(@job_scope_addition, :notice => 'Job scope addition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_scope_addition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_scope_additions/1
  # DELETE /job_scope_additions/1.xml
  def destroy
    @job_scope_addition = JobScopeAddition.find(params[:id])
    @job_scope_addition.destroy

    respond_to do |format|
      format.html { redirect_to(job_scope_additions_url) }
      format.xml  { head :ok }
    end
  end
end
