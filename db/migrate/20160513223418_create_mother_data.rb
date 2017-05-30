class CreateMotherData < ActiveRecord::Migration
  def change
    create_table :mother_data do |t|
      t.integer :mother_age
      t.integer :gestational_age
      t.string :prenatal_care
      t.integer :gravida
      t.integer :para
      t.integer :abortus
      t.integer :term
      t.integer :pre_pregnancy_weight
      t.integer :delivery_weight
      t.string :blood_type
      t.string :antibody_screen
      t.string :rpr
      t.string :hepatitis_b
      t.string :rubella
      t.string :HIV
      t.string :diabetes
      t.string :GBS
      t.string :amniocentesis
      t.text :previous_pregnancy_summary
      t.text :present_pregnancy_summary
      t.text :ultrasound_finding
      t.integer :birth_weight
      t.string :maceration_degree
      t.string :gross_appearance
      t.string :placenta_available_for_examination
      t.string :amniotic_fluid
      t.text :mother_medical_history
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
