class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.references :resume, null: false, foreign_key: true
      t.text :achievement_description

      t.timestamps
    end
  end
end
