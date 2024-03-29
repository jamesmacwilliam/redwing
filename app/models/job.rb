class Job < ActiveRecord::Base
  belongs_to :customer, :foreign_key => :CustomerID
  belongs_to :carrier, :foreign_key => :CarrierID
  belongs_to :work_site, :foreign_key => :SiteID
  belongs_to :project_type, :foreign_key => :ProjectTypeID
  belongs_to :scope_type, :foreign_key => :ScopeTypeID
  has_many :milestone_records
  belongs_to :js, :foreign_key => :id
  
  validates_presence_of :CarrierID, :CustomerID, :ProjectTypeID, :SiteID, :ScopeTypeID, :amount_billable
  validates_numericality_of :amount_billable
end