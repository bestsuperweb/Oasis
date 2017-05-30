class Internalap1 < ActiveRecord::Migration
  def change
    add_column :internals, :peritoneal_cavity_normal, :boolean
    add_column :internals, :stomach_and_duodenum_normal, :boolean
    add_column :internals, :small_intestine_normal, :boolean
    add_column :internals, :large_instestine_normal, :boolean
    add_column :internals, :liver_and_biliary_system_normal, :boolean
    add_column :internals, :pancreas_normal, :boolean
    add_column :internals, :right_adrenal_gland_normal, :boolean
    add_column :internals, :left_adrenal_gland_normal, :boolean
    add_column :internals, :spleen_normal, :boolean
    add_column :internals, :right_kidney_and_ureter_normal, :boolean
    add_column :internals, :left_kidney_and_ureter_normal, :boolean
    add_column :internals, :bladder_and_urethra_normal, :boolean
    add_column :internals, :internal_genitalia_male_normal, :boolean
    add_column :internals, :internal_genitalia_female_normal, :boolean
  end
end
