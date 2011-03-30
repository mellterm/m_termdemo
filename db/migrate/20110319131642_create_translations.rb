class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      	t.integer :source_id
      	t.integer :target_id
      	t.boolean :is_public, :default => false
      	t.integer :provider_id
      	t.integer :company_id
      	t.integer :source_doc_id
      	t.integer :user_id
      	t.integer :document_id
      	t.timestamps
    end
    	add_index :translations, :user_id
    
  end

  def self.down
  		remove_index :user_id
    	drop_table :translations
  end
end
