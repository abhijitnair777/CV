class AddingUIdToQualifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :qualifications, :users, index: true, foreign_key: true 
  end
end
