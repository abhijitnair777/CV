class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.bigint :contact
      t.string :password_enc
      t.string :city
      t.string :address
      t.date :dob

      t.timestamps
    end
  end
end
