class CreateBodyMeasurements < ActiveRecord::Migration
  def change
    create_table :body_measurements do |t|
      t.integer :crown_heel
      t.integer :crown_rump
      t.integer :head_circumference
      t.integer :chest_circumference
      t.integer :abdomen_circumference
      t.integer :weight
      t.integer :birth_weight
      t.integer :intercanthal_distance
      t.integer :interpupillary_distance
      t.integer :arms
      t.integer :leg
      t.integer :foot_length
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
