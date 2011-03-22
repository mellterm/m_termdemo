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
  belongs_to :translation
  validates_presence_of :content
end
