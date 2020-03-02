class Project < ApplicationRecord

  #validates :project_name, presence: true, uniqueness: true
  belongs_to :user
end
