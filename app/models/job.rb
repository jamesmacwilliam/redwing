class Job < ActiveRecord::Base
  has_one :customer
  has_one :carrier
  has_one :work_site
  has_one :project_type
end