class ScopeType < ActiveRecord::Base
  
  class << self
    def find_by_ProjectTypeID(project_type)
      where(:ProjectTypeID => project_type).first
    end
  end    
  
end
