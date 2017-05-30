class CreatePlacenta < ActiveRecord::Migration
  def change
    create_table :placenta do |t|
      t.integer :weight
      t.float :placental_weight_ratio
      t.integer :total_length
      t.string :vessels
      t.string :umbillical_cord_normal
      t.string :normal_no_funisitis
      t.string :normal_no_acute_vasculitis
      t.string :umbillical_cord_normal_no_other
      t.string :fetal_memberanes_normal
      t.string :normal_no_acute_chorioamnionitis
      t.string :normal_no_pigmented_macrophages
      t.string :fetal_membranes_normal_no_other
      t.string :chorionic_plate_and_stem_vessels_normal
      t.string :normal_no_acute_vasculitis
      t.string :normal_no_thrombosis
      t.string :normal_no_hemorrhagic_endovasculosis
      t.string :normal_no_cushion_lesions_with_or_without_fibrin
      t.string :chorionic_plate_and_stem_vessels_normal_no_other
      t.string :maturation_appropriate_for_gestational_age
      t.string :maturation_no_specify
      t.string :chorionic_villi_and_intervillous_space_normal
      t.string :chorionic_villi_abnormal_chronic_lymphohistiocytic_villitis
      t.string :chorionic_villi_abnormal_acute_intervillositis
      t.string :chorionic_villi_abnormal_avascular_villi
      t.string :chorionic_villi_abnormal_other
      t.string :basal_plate_normal
      t.string :normal_no_maternal_vessels_normal
      t.string :normal_no_decidua_basalis_normal
      t.string :normal_no_basalplate_other
      t.string :normal_no_maternal_vessels_normal_specify
      t.string :normal_no_decidua_basalis_normal_specify
      t.references :description, index: true, foreign_key: true      
      t.string :placentation
      t.string :gross_description

      t.timestamps null: false
    end
  end
end
