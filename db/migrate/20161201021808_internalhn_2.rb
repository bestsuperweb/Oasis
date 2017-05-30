class Internalhn2 < ActiveRecord::Migration
  def change
    add_column :internals, :subcutaneous_galea, :string
  end
end
