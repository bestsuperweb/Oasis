class Internalap16 < ActiveRecord::Migration
  def change
    add_column :internals, :right_kidney_weight, :float
    #add_column :internals, :left_kidney_weight, :float
  end
end
