class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :institute_name
      t.date :year_of_passing
      t.decimal :percentage
      t.references :resume, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
