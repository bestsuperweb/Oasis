class Internal32 < ActiveRecord::Migration
  def change
    add_column :internals, :bladder_and_urethra_md, :text
    add_column :internals, :female_genetalia_md, :text
    add_column :internals, :large_intestine_md, :text
    add_column :internals, :left_adrenal_gland_md, :text
    add_column :internals, :left_kidney_ureter_md, :text
    add_column :internals, :liver_and_biliary_system_md, :text
    add_column :internals, :male_genetalia_md, :text
    add_column :internals, :pancreas_md, :text
    add_column :internals, :peritoneal_cavity_md, :text
    add_column :internals, :right_adrenal_gland_md, :text
    add_column :internals, :right_kidney_and_ureter_md, :text
    add_column :internals, :small_intesting_md, :text
    add_column :internals, :spleen_md, :text
    add_column :internals, :stomach_and_duodenum_md, :text
  end
end
