class CreateWorkSites < ActiveRecord::Migration
  def self.up
    create_table :work_sites do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :work_sites
  end
end
