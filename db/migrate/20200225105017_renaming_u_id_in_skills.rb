class RenamingUIdInSkills < ActiveRecord::Migration[6.0]
  def change
    rename_column :skills, :resumes_id, :resume_id
  end
end