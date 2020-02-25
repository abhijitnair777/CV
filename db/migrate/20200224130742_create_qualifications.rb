class CreateQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :qualifications do |t|
      t.string :qualification_type

      t.timestamps
    end
  end
end
