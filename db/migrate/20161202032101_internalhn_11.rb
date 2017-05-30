class Internalhn11 < ActiveRecord::Migration
  def change
    add_column :internals, :spinal_cord_normal, :boolean
  end
end
