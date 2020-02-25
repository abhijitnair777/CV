class User < ApplicationRecord
  require 'digest'

  has_and_belongs_to_many :projects
  has_many :qualifications
  

  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  # validates :name, :city, :address, presence: true
  # validates :email, uniqueness: true, presence: true   #, :format => EMAIL_REGEX
  # validates :contact, presence: true, numericality: true,
  # length: { is: 10 }
  #validates :password_enc, length: { in: 3..12 }
  # before_validation :ensure_password_has_a_value

  def enc(string)
    Digest::MD5.hexdigest string
  end

  def password
    password_enc
  end

  def authenticate?(authentication_password)
    password == enc(authentication_password)
  end

  def password=(authentication_password)
    self.password_enc = enc(authentication_password)
  end

  def password!(authentication_password)
    self.password = authentication_password
    save!
  end	
end
