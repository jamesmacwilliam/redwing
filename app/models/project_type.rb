class ProjectType < ActiveRecord::Base
  has_many :scope_types
end
