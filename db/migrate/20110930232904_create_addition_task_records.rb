class CreateAdditionTaskRecords < ActiveRecord::Migration
  def self.up
    create_table :addition_task_records do |t|
      t.integer :jobs_id
      t.integer :milestone_tasks_id
      t.string :date_completed

      t.timestamps
    end
  end

  def self.down
    drop_table :addition_task_records
  end
end
