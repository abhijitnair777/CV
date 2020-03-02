class AddingUIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :users, index: true, foreign_key: true 
  end
end
