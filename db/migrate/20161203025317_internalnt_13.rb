class Internalnt13 < ActiveRecord::Migration
  def change
    add_column :internals, :pleural_cavities_normal, :boolean
  end
end
