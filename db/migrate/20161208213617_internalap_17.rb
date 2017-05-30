class Internalap17 < ActiveRecord::Migration
  def change
    add_column :internals, :right_kidney_cut_surface, :string
    add_column :internals, :right_kidney_cut_surface_specify , :text
    add_column :internals, :left_kidney_cut_surface, :string
    add_column :internals, :left_kidney_cut_surface_specify , :text
  end
end
