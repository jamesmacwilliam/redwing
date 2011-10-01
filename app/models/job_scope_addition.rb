class JobScopeAddition < ActiveRecord::Base
  belongs_to :scope_type, :foreign_key => :ScopeTypeID
  
  validates_presence_of :ScopeTypeID, :amount_billable
  validates_numericality_of :amount_billable  
  
  class << self
    def find_all_by_JobID(JobID)
      where(:JobID => JobID)
  end
end
