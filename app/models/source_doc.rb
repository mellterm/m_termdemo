# == Schema Information
# Schema version: 20110322031717
#
# Table name: source_docs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SourceDoc < ActiveRecord::Base
	has_many :translations
end
