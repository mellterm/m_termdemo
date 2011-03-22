# == Schema Information
# Schema version: 20110322031717
#
# Table name: targets
#
#  id             :integer         not null, primary key
#  translation_id :integer
#  content        :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Target < ActiveRecord::Base
  belongs_to :translation
  validates_presence_of :content
  
  has_one :language, :dependent => :destroy
  
  after_save :set_dependencies
  
  def set_dependencies
    translation.target_id = self.id
    translation.save
  end
end
