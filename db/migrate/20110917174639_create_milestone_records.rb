class CreateMilestoneRecords < ActiveRecord::Migration
  def self.up
    create_table :milestone_records do |t|
      t.integer :jobs_id
      t.integer :milestone_tasks_id
      t.date :date_completed

      t.timestamps
    end
  end

  def self.down
    drop_table :milestone_records
  end
end
