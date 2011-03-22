class CreateSourceDocs < ActiveRecord::Migration
  def self.up
    create_table :source_docs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :source_docs
  end
end
