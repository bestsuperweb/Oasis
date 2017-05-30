class Internalap8 < ActiveRecord::Migration
  def change
    add_column :internals, :hilar_vessels_portal_vein_hepatic_artery, :string
    add_column :internals, :hilar_vessels_portal_vein_hepatic_artery_specify, :string
  end
end
