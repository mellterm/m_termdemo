# == Schema Information
# Schema version: 20110329045905
#
# Table name: segments
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  language_id :integer
#  definition  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Segment < ActiveRecord::Base
		
	has_one :language, :dependent => :destroy
	
	has_many :translations
	has_many :segments, :through => :translations
	
	has_many :associations, :as => :associable
	
end
