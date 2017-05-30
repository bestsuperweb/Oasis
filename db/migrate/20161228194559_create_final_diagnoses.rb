class CreateFinalDiagnoses < ActiveRecord::Migration
  def change
    create_table :final_diagnoses do |t|
      t.text :report
      t.references :description, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
