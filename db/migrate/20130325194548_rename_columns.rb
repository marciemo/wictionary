class RenameColumns < ActiveRecord::Migration
  def change
    change_table :words do |t|
      t.rename :text, :entry
    end
    change_table :definitions do |t|
      t.rename :entry, :text
    end
  end
end