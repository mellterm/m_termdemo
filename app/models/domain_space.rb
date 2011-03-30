# == Schema Information
# Schema version: 20110329045905
#
# Table name: domain_spaces
#
#  id             :integer         not null, primary key
#  translation_id :integer
#  domain_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class DomainSpace < ActiveRecord::Base
	
	belongs_to :domain
	belongs_to :translation
end
