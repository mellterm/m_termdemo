# == Schema Information
# Schema version: 20110322031717
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  doc_type   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Document < ActiveRecord::Base
	
	has_and_belongs_to_many :tags
	belongs_to :user
	
	DOC_TYPES = %w{memory glossary sourcedoc reference}
	
	
	validates_inclusion_of 	:doc_type,  :in => TRANSLATION_TYPES, 
  								:message => "must be one of: #{DOC_TYPES.join(', ')}" 
	
	
end
