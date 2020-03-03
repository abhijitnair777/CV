class Resume < ApplicationRecord
  belongs_to :user
  has_many :skills

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank
end
