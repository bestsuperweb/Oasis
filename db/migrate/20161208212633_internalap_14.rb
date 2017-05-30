class Internalap14 < ActiveRecord::Migration
  def change
    add_column :internals, :spleen_cut_surface, :string
    add_column :internals, :spleen_cut_surface_specify, :text
  end
end
