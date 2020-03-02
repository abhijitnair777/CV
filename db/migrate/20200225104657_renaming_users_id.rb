class RenamingUsersId < ActiveRecord::Migration[6.0]
  def change
     rename_column :resumes, :users_id, :user_id
  end
end
