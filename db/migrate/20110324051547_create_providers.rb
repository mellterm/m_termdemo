class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.integer :default_domain_id
      t.integer :default_source_doc_id
      t.integer :default_source_language_id
      t.integer :default_target_language_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :providers
  end
end
