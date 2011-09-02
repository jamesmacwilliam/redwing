class CreateMyTestObjects < ActiveRecord::Migration
  def self.up
    create_table :my_test_objects do |t|
      t.string :name
      t.float :cost
      t.boolean :is_active
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :my_test_objects
  end
end
