# == Schema Information
# Schema version: 20110322031717
#
# Table name: languages
#
#  id          :integer         not null, primary key
#  code        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Language < ActiveRecord::Base
	
	has_many :terms
	has_many :segments
	
	
end
