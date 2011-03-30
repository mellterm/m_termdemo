class CreateAssociations < ActiveRecord::Migration
  def self.up
    create_table :associations do |t|
      t.text :description
      t.references :associable, :polymorphic => true
    end    
  end

  def self.down
    drop_table :associations
  end
end
