class AddUIdToEducation < ActiveRecord::Migration[6.0]
  def change
    add_reference :educations, :user, index: true, foreign_key: true 
  end
end
