class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.integer :case
      t.integer :hospital
      t.integer :age
      t.date :date_admission
      t.string :race
      t.string :sex
      t.string :pathologist
      t.string :physician
      t.string :attendant
      t.date :date_autopsy
      t.time :time_of_autopsy
      t.string :restrictions
      t.string :prosector
      t.string :type_of_gestation
      t.string :specify_number

      t.timestamps null: false
    end
  end
end
