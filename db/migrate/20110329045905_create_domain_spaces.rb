class CreateDomainSpaces < ActiveRecord::Migration
  def self.up
    create_table :domain_spaces do |t|
      t.integer :translation_id
      t.integer :domain_id
      t.timestamps
    end
  end

  def self.down
    drop_table :domain_spaces
  end
end
