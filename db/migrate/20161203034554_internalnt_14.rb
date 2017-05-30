class Internalnt14 < ActiveRecord::Migration
  def change
    add_column :internals,:mediastinum_normal ,:boolean
    add_column :internals,:lungs_normal ,:boolean
    add_column :internals,:diaphragm_normal ,:boolean
    add_column :internals,:thymus_normal ,:boolean
    add_column :internals,:pericardial_sac_normal ,:boolean
    add_column :internals,:thyroidr_parathyroid_normal ,:boolean
    add_column :internals,:esophagus_normal ,:boolean
    add_column :internals,:heart_normal ,:boolean
    add_column :internals,:chambers_and_septae_normal ,:boolean
    add_column :internals,:valves_normal,:boolean
    add_column :internals,:vessels_and_ducts_normal,:boolean
  end
end
