class CreateMilestoneTasks < ActiveRecord::Migration
  def self.up
    create_table :milestone_tasks do |t|
      t.integer :MilestoneValidationID
      t.integer :ScopeTypeID
      t.integer :PercentageID
      t.integer :ParentMilestoneTaskID

      t.timestamps
    end
  end

  def self.down
    drop_table :milestone_tasks
  end
end
