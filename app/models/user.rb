class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects 
  has_many :educations
  has_many :resumes, dependent: :destroy
  
  validates :name, :city, :address, presence: true
  validates :contact, presence: true, numericality: true,
   length: { is: 10 }
end
