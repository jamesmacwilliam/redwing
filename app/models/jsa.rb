class Jsa < ActiveRecord::Base
  set_table_name :jsa
  
  class << self
        
    def find_by_jobs_id(jobs_id)
      where(:jobs_id => jobs_id).first
    end
    
    def find_all_by_jobs_id(jobs_id)
      where(:jobs_id => jobs_id)
    end
    
  end
end
