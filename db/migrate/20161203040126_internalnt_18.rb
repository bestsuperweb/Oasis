class Internalnt18 < ActiveRecord::Migration
  def change
     add_column :internals, :thyroid_parathyroid_normal, :boolean
  end
end
