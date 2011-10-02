class JobScopeAddition < ActiveRecord::Base
  belongs_to :scope_type, :foreign_key => :ScopeTypeID
  
  validates_presence_of :ScopeTypeID, :amount_billable
  validates_numericality_of :amount_billable  
  
  class << self
    def find_all_by_jobs_id(jobs_id)
      where(:jobs_id => jobs_id)
    end  
  end
end
