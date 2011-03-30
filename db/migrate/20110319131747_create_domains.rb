class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.text :code
      t.text :description
    end
  end

  def self.down
    drop_table :domains
  end
end
