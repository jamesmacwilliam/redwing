class MilestoneTask < ActiveRecord::Base
  belongs_to :scope_type, :foreign_key => :ScopeTypeID
  belongs_to :milestone_validation, :foreign_key => :MilestoneValidationID
  belongs_to :parent_task, :class_name => "MilestoneTask", :foreign_key => :ParentMilestoneTaskID
  
  validates_presence_of :PercentageID, :ScopeTypeID, :MilestoneValidationID
  
  class << self
    def find_all_by_scope_type(scope_type)
      where(:ScopeTypeID => scope_type)
    end
  end
end
