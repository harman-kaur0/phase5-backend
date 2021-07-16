class CreateLabResults < ActiveRecord::Migration[6.1]
  def change
    create_table :lab_results do |t|
      t.string :name
      t.string :url
      t.datetime :date
      t.string :doctor_name
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
