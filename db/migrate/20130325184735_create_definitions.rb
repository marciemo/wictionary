class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.column :entry, :string
      t.column :part_of_speech, :string
      t.column :word_id, :int

      t.timestamps
    end
  end
end
