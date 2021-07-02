class CreateInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :insurances do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :group_number
      t.string :name
      t.string :subscriber_name
      t.string :subscriber_number

      t.timestamps
    end
  end
end
