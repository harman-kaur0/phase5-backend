class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.string :name
      t.string :directions
      t.string :quantity
      t.boolean :approved, default: false
      t.string :notes

      t.timestamps
    end
  end
end
