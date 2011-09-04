class Job < ActiveRecord::Base
  belongs_to :customer, :foreign_key => :CustomerID
  belongs_to :carrier, :foreign_key => :CarrierID
  belongs_to :work_site, :foreign_key => :WorkSiteID
  belongs_to :project_type, :foreign_key => :ProjectTypeID
  belongs_to :scope_type, :foreign_key => :ScopeTypeID
end