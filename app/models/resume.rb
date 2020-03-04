class Resume < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :achievements, dependent: :destroy

  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :achievements, allow_destroy: true, reject_if: :all_blank
end
