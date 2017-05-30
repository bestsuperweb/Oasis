class Internalhn4 < ActiveRecord::Migration
  def change
    add_column :internals, :scalp_and_cranium_normal, :boolean
  end
end
