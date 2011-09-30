class CreateJobScopeAdditions < ActiveRecord::Migration
  def self.up
    create_table :job_scope_additions do |t|
      t.integer :ScopeTypeID
      t.integer :JobID

      t.timestamps
    end
  end

  def self.down
    drop_table :job_scope_additions
  end
end
