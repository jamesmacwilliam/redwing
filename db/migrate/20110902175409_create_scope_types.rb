class CreateScopeTypes < ActiveRecord::Migration
  def self.up
    create_table :scope_types do |t|
      t.string :name
      t.integer :ProjectTypeID
      t.boolean :_5p
      t.boolean :_5b
      t.boolean :_10p
      t.boolean :_10b
      t.boolean :_15p
      t.boolean :_15b
      t.boolean :_20p
      t.boolean :_20b
      t.boolean :_25p
      t.boolean :_25b
      t.boolean :_30p
      t.boolean :_30b
      t.boolean :_35p
      t.boolean :_35b
      t.boolean :_40p
      t.boolean :_40b
      t.boolean :_45p
      t.boolean :_45b
      t.boolean :_50p
      t.boolean :_50b
      t.boolean :_55p
      t.boolean :_55b
      t.boolean :_60p
      t.boolean :_60b
      t.boolean :_65p
      t.boolean :_65b
      t.boolean :_70p
      t.boolean :_70b
      t.boolean :_75p
      t.boolean :_75b
      t.boolean :_80p
      t.boolean :_80b
      t.boolean :_85p
      t.boolean :_85b
      t.boolean :_90p
      t.boolean :_90b
      t.boolean :_95p
      t.boolean :_95b
      t.boolean :_100p
      t.boolean :_100b

      t.timestamps
    end
  end

  def self.down
    drop_table :scope_types
  end
end
