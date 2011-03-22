class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.string :doc_type
      t.integer :user_id

      t.timestamps
    end
     create_table :documents_tags, :id => false do |t|
      t.integer :document_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :documents
  end
end
