# == Schema Information
# Schema version: 20110322031717
#
# Table name: sources
#
#  id                 :integer         not null, primary key
#  translation_id     :integer
#  source_language_id :integer
#  target_language_id :integer
#  content            :text
#  created_at         :datetime
#  updated_at         :datetime
#

class Source < ActiveRecord::Base
  belongs_to :translation
  validates_presence_of :content
  
  has_one :language, :dependent => :destroy
  
  
  
  after_save :set_dependencies
  
  def set_dependencies
    translation.source_id = self.id
    translation.save
  end
  
end
