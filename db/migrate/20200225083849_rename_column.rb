class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :decription, :description 
  end
end
