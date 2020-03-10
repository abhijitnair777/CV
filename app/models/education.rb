class Education < ApplicationRecord
  belongs_to :user
  belongs_to :qualification

  validates :year_of_passing, presence: true
  validates :institute_name, presence: true
  validates :percentage, presence: true
end