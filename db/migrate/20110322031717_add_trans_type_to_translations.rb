class AddTransTypeToTranslations < ActiveRecord::Migration
  def self.up
  	Translation.destroy_all
    add_column :translations, :trans_type, :string
  end

  def self.down
    remove_column :translations, :trans_type
  end
end
