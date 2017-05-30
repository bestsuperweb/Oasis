class AddColumnsToInternalGn < ActiveRecord::Migration
  def change
    add_column :internals , :subcutaneous_normal ,:boolean
    add_column :internals , :bones_normal ,:boolean
    add_column :internals , :skeletal_muscle_normal ,:boolean
    add_column :internals , :skeletal_muscle_consistency , :string
    add_column :internals , :lymphnodes_normal ,:boolean
    add_column :internals , :venous_system_normal ,:boolean
    add_column :internals , :venous_system_other , :text
    add_column :internals , :arterial_system_normal ,:boolean
    add_column :internals , :arterial_system_state_of_distension , :string
    add_column :internals , :arterial_system_contents , :string
    add_column :internals , :arterial_system_anomalies , :string
    add_column :internals , :arterial_system_other , :text
    add_column :internals , :lymphatic_system_normal ,:boolean
    add_column :internals , :lymphatic_system_state_of_distension , :string
    add_column :internals , :lymphatic_system_contents , :string
    add_column :internals , :lymphatic_system_anomalies , :string
    add_column :internals , :lymphatic_system_other , :text
  end
end
