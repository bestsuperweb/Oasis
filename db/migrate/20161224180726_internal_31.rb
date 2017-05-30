class Internal31 < ActiveRecord::Migration
  def change
   add_column :internals, :chambers_and_septae_md, :text
   add_column :internals, :diaphragm_md, :text
   add_column :internals, :esophagus_md, :text
   add_column :internals, :heart_md, :text
   add_column :internals, :larynx_md, :text
   add_column :internals, :lungs_md, :text
   add_column :internals, :mediastinum_md, :text
   add_column :internals, :pericardial_sac_md, :text
   add_column :internals, :pleural_cavities_md, :text
   add_column :internals, :thymus_md, :text
   add_column :internals, :thyroid_pt_md, :text
   add_column :internals, :valves_md, :text
   add_column :internals, :vessels_and_ducts_md, :text
  end
end
