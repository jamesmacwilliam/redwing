class MilestoneTask < ActiveRecord::Base
  belongs_to :scope_type, :foreign_key => :ScopeTypeID
  belongs_to :milestone_validation, :foreign_key => :MilestoneValidationID
end
