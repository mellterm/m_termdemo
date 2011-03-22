class ChangeSources < ActiveRecord::Migration
  def self.up
  	change_table(:sources) do |t|
    t.remove :source_language_id, :target_language_id
    t.integer :language_id
	t.index :content
	end
  end

  	
  end

  def self.down
  	change_table(:sources) do |t|
    t.remove :language_id
  	t.integer :source_language_id 
  	t.integer :target_language_id
  	t.remove_index :content
  end
end
