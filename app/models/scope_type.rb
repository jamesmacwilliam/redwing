class ScopeType < ActiveRecord::Base
  belongs_to :project_type, :foreign_key => :ProjectTypeID
  has_many :milestone_tasks
  
  class << self
    def find_by_ProjectTypeID(project_type)
      where(:ProjectTypeID => project_type)
    end
  end    
  
end
