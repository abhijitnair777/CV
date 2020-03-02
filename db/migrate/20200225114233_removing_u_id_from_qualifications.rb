class RemovingUIdFromQualifications < ActiveRecord::Migration[6.0]
  def change
    remove_column :qualifications, :user_id, :bigint
  end
end
