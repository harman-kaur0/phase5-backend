class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :role
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :title

      t.timestamps
    end
  end
end
