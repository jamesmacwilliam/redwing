class MilestoneRecord < ActiveRecord::Base
  
  belongs_to :milestone_task, :foreign_key => :milestone_tasks_id
  
  class << self
    def find_by_milestone_tasks_id(milestone_tasks_id)
      where(:milestone_tasks_id => milestone_tasks_id).first
    end
    
    def find_all_by_milestone_tasks_id(milestone_tasks_id)
      where(:milestone_tasks_id => milestone_tasks_id)
    end
    
    
    def find_by_jobs_id(jobs_id)
      where(:jobs_id => jobs_id).first
    end
    
  end
end
