class Internalhn7 < ActiveRecord::Migration
  def change
    add_column :internals ,:dura_and_venous_sinuses_normal, :boolean
  end
end
