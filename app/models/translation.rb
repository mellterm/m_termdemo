# == Schema Information
# Schema version: 20110329045905
#
# Table name: translations
#
#  id        :integer         not null, primary key
#  source_id :integer
#  target_id :integer
#  is_public :boolean
#

class Translation < ActiveRecord::Base
  
	
	belongs_to :term, :foreign_key => "source_id"
	belongs_to :term, :foreign_key => "target_id"
  
	belongs_to :segment, :foreign_key => "source_id"
	belongs_to :segment, :foreign_key => "target_id"
	
	has_many :domain_spaces
	has_many :domains, :through => :domain_spaces
	
  	belongs_to :document
  
 	belongs_to :source_doc			#context info
  	belongs_to :company				#context info
  	belongs_to :provider				#translation container belongs to user
  	belongs_to :user					#creator
  
  	#translation polymorphic assoc. with class 'document', 'company' 'translation', 'segment'
  	has_many :associations, :as => :associable
  	has_many :associated_documents, :through => :associations,
  			:source => :associable, :source_type => 'Document'  			
  
  #accepts_nested_attributes_for :term
  #accepts_nested_attributes_for :segment
  #accepts_nested_attributes_for :domains, :reject_if => proc {|attrs| attrs['content'].blank? }, :allow_destroy => true
  
  
### reuse if segments and termsnot separate
  #is the following code unnecessary of using radio button?
  #TRANSLATION_TYPES = %w{term segment}
  
  #validates_inclusion_of 	:doc_type,  :in => TRANSLATION_TYPES, 
  #							:message => "must be one of: #{TRANSLATION_TYPES.join(', ')}" 
##  
  
  
  #def Translation.new_with_relations
   # translation = Translation.new
    #translation.build_source
    #translation.build_target
    #translation.domains.build
    #translation.domains.build
    #translation.domains.build
    #translation
  #end
  
  #def check_domains
   # (3 - self.domains.count).times do self.domains.build end
  #end
  
end
