class RemoveDefinitions < ActiveRecord::Migration
  def change
    drop_table :definitions
  end
end
