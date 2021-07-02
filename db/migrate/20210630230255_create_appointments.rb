class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.datetime :date_and_time
      t.string :reason

      t.timestamps
    end
  end
end
