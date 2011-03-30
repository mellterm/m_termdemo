# == Schema Information
# Schema version: 20110322031717
#
# Table name: domains
#
#  id         :integer         not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Domain < ActiveRecord::Base
  
	has_many :domain_spaces
	has_many :translations, :through => :domain_spaces	
	
	
  	validates_presence_of :content
end
