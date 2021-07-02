class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :address
      t.datetime :date_of_birth
      t.string :email
      t.string :ethnicity
      t.string :language
      t.string :name
      t.string :password_digest
      t.string :phone_number
      t.string :race
      t.string :username

      t.timestamps
    end
  end
end
