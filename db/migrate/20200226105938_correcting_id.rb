class CorrectingId < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :users_id, :bigint
  end
end
