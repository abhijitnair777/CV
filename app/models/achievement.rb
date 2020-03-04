class Achievement < ApplicationRecord
  belongs_to :resume, optional: true
end
