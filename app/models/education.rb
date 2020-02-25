class Education < ApplicationRecord
  belongs_to :resume
  belongs_to :qualification
end
