class ScopeType < ActiveRecord::Base
  belongs_to :project_type, :foreign_key => :ProjectTypeID
  
  class << self
    def find_by_ProjectTypeID(project_type)
      where(:ProjectTypeID => project_type)
    end
  end    
  
end
