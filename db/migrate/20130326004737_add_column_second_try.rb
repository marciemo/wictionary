class AddColumnSecondTry < ActiveRecord::Migration
  def change
    add_column :words, :definition, :string
  end
end
