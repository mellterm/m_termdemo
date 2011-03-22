class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.text :content
      t.timestamps
    end
    create_table :domains_translations, :id => false do |t|
      t.integer :domain_id
      t.integer :translation_id
    end
  end

  def self.down
    drop_table :domains
  end
end
