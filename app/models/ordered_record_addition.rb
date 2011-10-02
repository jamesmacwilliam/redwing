class OrderedRecordAddition < ActiveRecord::Base
  
  class << self
    def find_all_by_jobs_id(jobs_id)
      where(:jobs_id => jobs_id).order("rank asc")
    end
  end
  
end