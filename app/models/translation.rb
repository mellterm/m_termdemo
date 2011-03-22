# == Schema Information
# Schema version: 20110322031717
#
# Table name: translations
#
#  id         :integer         not null, primary key
#  source_id  :integer
#  target_id  :integer
#  is_public  :boolean
#  user_id    :integer
#  trans_type :string(255)
#

class Translation < ActiveRecord::Base
  has_one :source, :dependent => :destroy
  has_one :target, :dependent => :destroy

  has_and_belongs_to_many :domains
  
  belongs_to :source_doc
  belongs_to :company
  
  accepts_nested_attributes_for :source
  accepts_nested_attributes_for :target
  accepts_nested_attributes_for :domains, :reject_if => proc {|attrs| attrs['content'].blank? }, :allow_destroy => true
  
  
  
  #is the following code unnecessary of using radio button?
  TRANSLATION_TYPES = %w{term segment}
  
  validates_inclusion_of 	:doc_type,  :in => TRANSLATION_TYPES, 
  							:message => "must be one of: #{TRANS_TYPES.join(', ')}" 
  
  
  
  def Translation.new_with_relations
    translation = Translation.new
    translation.build_source
    translation.build_target
    translation.domains.build
    translation.domains.build
    translation.domains.build
    translation
  end
  
  def check_domains
    (3 - self.domains.count).times do self.domains.build end
  end
  
end
