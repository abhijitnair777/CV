class Qualification < ApplicationRecord
  belongs_to :user
  has_many :educations
end
