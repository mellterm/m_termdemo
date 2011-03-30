# == Schema Information
# Schema version: 20110329045905
#
# Table name: associations
#
#  id              :integer         not null, primary key
#  description     :text
#  associable_id   :integer
#  associable_type :string(255)
#

class Association < ActiveRecord::Base
	
	#make this for all classes?
	belongs_to :associable, :polymorphic => true
	belongs_to :document
	belongs_to :translation
	belongs_to :company
	
	ASSOCIATION_DESCRIPTIONS= %w{variant context synonym}
	
	
	validates_inclusion_of 	:description,  :in => ASSOCIATION_DESCRIPTIONS, 
  								:message => "must be one of: #ASSOCIATION_DESCRIPTIONS.join(', ')}" 
	
	
	
	
end
