class Internalhn12 < ActiveRecord::Migration
  def change
    add_column :internals, :larynx_and_trachea_normal, :boolean
  end
end
