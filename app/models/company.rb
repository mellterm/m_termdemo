# == Schema Information
# Schema version: 20110322031717
#
# Table name: companies
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  company_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Company < ActiveRecord::Base
	
	has_many :translations	
end
