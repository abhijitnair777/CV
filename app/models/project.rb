class Project < ApplicationRecord

  validates :project_name, presence: true, uniqueness: true  
  has_many :users, :through => :user_projects 
  has_many :user_projects, :dependent => :destroy
end
