class ExtendExternalForBodyMeasurements < ActiveRecord::Migration
  def change
    add_column :externals, :birth_weight, :float
    add_column :externals, :weight_at_autopsy, :float
    add_column :externals, :crown_heel_length, :float
    add_column :externals, :crown_rump_length, :float
    add_column :externals, :head_circumference, :float
    add_column :externals, :chest_circumference, :float
    add_column :externals, :abdomen_circumference, :float
    add_column :externals, :foot_length, :float
    add_column :externals, :inner_intercanthal_distance, :float
    add_column :externals, :interpupillary_distance, :float
    add_column :externals, :outer_intercanthal_distance, :float
    add_column :externals, :arm_length, :float
    add_column :externals, :leg_length, :float
  end
end

#:birth_weight,  :weight_at_autopsy,  :crown_heel_length,  :crown_rump_length,  :head_circumference,  :chest_circumference,  :abdomen_circumference,  :foot_length,  :inner_intercanthal_distance,  :interpupillary_distance,  :outer_intercanthal_distance,  :arm_length,  :leg_length
