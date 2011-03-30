class CreateSegments < ActiveRecord::Migration
  def self.up
    create_table :segments do |t|
      t.string :content
      t.integer :language_id
      t.string :definition

      t.timestamps
    end
    	add_index :segments, :content
  end

  def self.down
  	remove_index :content
    drop_table :segments
  end
end
