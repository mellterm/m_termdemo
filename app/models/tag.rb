# == Schema Information
# Schema version: 20110322031717
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
	
	belongs_to :document
end
