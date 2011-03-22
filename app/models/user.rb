# == Schema Information
# Schema version: 20110322031717
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  email               :string(255)     not null
#  first_name          :string(255)     not null
#  last_name           :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer         default(0), not null
#  failed_login_count  :integer         default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base
  attr_accessor :require_password, :code
  
  # setup authlogic and use bcrypt to store passwords
  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :admin

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :password, :if => :require_password?
  validates_presence_of :password_confirmation, :if => :require_password?
  
  has_many :translations, :dependent => :destroy
  has_many :documents
  
  scope :admins, where(:admin => true)
  scope :forward,  order('created_at ASC')
  scope :backward, order('created_at DESC')  
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def require_password?
    new_record? || require_password
  end
  
  def is_admin?
    admin
  end
  
  def toggle_admin!
    self.admin = !is_admin?
    self.save
  end
  
end
