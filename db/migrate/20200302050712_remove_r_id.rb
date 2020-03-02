class RemoveRId < ActiveRecord::Migration[6.0]
  def change 
    remove_column :educations, :resume_id, :bigint
  end
end
