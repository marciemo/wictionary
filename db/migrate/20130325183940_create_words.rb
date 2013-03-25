class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.column :text, :string

      t.timestamps
    end
  end
end
