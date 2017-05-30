class Internalap4 < ActiveRecord::Migration
  def change
    add_column :internals, :meckel_diverticulum_specify, :text
  end
end
