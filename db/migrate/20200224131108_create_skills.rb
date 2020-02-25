class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.string :skill_description
      t.references :resumes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
