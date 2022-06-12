class Project < ApplicationRecord

  #validates :project_name, presence: true, uniqueness: true
  belongs_to :user
  scope :long_title, -> { where(project_name: "Robot") }

  def self.long_title
    where(project_name: "Robot")
  end
end
