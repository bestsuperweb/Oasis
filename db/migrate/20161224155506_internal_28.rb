class Internal28 < ActiveRecord::Migration
  def change
    add_column :internals, :arterial_system_md, :text
    add_column :internals, :bone_md, :text
    add_column :internals, :lymphatic_system_md, :text
    add_column :internals, :peripheral_nervous_system_md, :text
    add_column :internals, :skeletal_muscle_md, :text
    add_column :internals, :subcutaneous_md, :text
    add_column :internals, :venous_system_md, :text
  end
end
