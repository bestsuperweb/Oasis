class Internalap12 < ActiveRecord::Migration
  def change
    add_column :internals, :pancreas_external_surface, :string
    add_column :internals, :pancreas_external_surface_specify, :text
  end
end
