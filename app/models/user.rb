class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects 
  has_many :educations
  has_many :resumes
  
  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  # validates :name, :city, :address, presence: true
  # validates :email, uniqueness: true, presence: true   #, :format => EMAIL_REGEX
  # validates :contact, presence: true, numericality: true,
  # length: { is: 10 }
  #validates :password_enc, length: { in: 3..12 }
  # before_validation :ensure_password_has_a_value
end
