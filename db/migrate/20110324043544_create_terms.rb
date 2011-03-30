class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      	t.string :content
      	t.integer :language_id
      	t.string :definition

     	t.timestamps
    end
    	add_index :terms, :content
  end

  def self.down
  		remove_index :content
   		drop_table :terms
  end
end
