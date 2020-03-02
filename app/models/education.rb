class Education < ApplicationRecord
  belongs_to :user
  belongs_to :qualification
end
