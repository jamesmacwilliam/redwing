class Jobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.integer :CarrierID
      t.integer :CustomerID
      t.integer :SiteID
      t.integer :ProjectTypeID
      t.integer :ScopeTypeID
      t.string  :PONumber
      t.float   :amount_billable
      t.boolean :is_void

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
