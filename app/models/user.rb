class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :address, :province_id
  
  attr_accessor :password
  before_save :encrypt_password

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :address, :presence => true
  validates :province, :presence => true


  belongs_to :province
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end