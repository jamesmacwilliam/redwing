class MilestoneValidation < ActiveRecord::Base
  has_many :milestone_tasks
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
