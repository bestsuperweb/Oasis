class Internalhn1 < ActiveRecord::Migration
  def change
    add_column :internals, :subcutaneous_galea_specify, :text
  end
end
