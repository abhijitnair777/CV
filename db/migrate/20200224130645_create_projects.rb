class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :url
      t.string :decription

      t.timestamps
    end
  end
end
