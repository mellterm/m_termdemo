# == Schema Information
# Schema version: 20110329045905
#
# Table name: providers
#
#  id                         :integer         not null, primary key
#  name                       :string(255)
#  description                :string(255)
#  default_domain_id          :integer
#  default_source_doc_id      :integer
#  default_source_language_id :integer
#  default_target_language_id :integer
#  user_id                    :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#

class Provider < ActiveRecord::Base
  attr_accessible :name, :description, :default_domain_id, :default_source_doc_id, :default_source_language_id, :default_target_language_id, :user_id
  
  
  has_many :documents 
  belongs_to :user
  belongs_to :language, :foreign_key => :default_source_language_id
  belongs_to :language, :foreign_key => :default_language_language_id
  belongs_to :domain, :foreign_key => :default_domain_id
  has_many :translations, :dependent => :destroy
  
  
end
