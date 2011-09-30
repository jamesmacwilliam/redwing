class ApplicationController < ActionController::Base
  protect_from_forgery
  #test
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
  
  def delete_records(recs)
    recs.each do |r|
      r.destroy
    end
  end  
  
  def order_rows(job_id)
    records = OrderedRecord.find_all_by_jobs_id(job_id)
    recs_perm = MilestoneRecord.where("0")
    records.each do |x|
      recs_perm.push(MilestoneRecord.find(x.id))
    end
    recs_perm
  end
  
end
