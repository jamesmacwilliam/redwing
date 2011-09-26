class MilestoneRecord < ActiveRecord::Base
  
  belongs_to :milestone_task, :foreign_key => :milestone_tasks_id

  validates_format_of :date_completed,
      :with => /\d{2}\/\d{2}\/\d{4}/i, 
      :message => "^Date must be in the following format: mm/dd/yyyy",
      :allow_blank => true, :allow_nil => true
  
  def date_completed_is_nil_or_blank
    return true unless self.date_completed
    return true if self.date_completed == ""
    return false
  end
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
