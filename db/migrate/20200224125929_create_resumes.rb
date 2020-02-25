class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :objective
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
