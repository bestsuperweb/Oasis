class CreateProvisionalDiagnoses < ActiveRecord::Migration
  def change
    create_table :provisional_diagnoses do |t|
      t.text :report
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
