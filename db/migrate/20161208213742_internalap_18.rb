class Internalap18 < ActiveRecord::Migration
  def change
    add_column :internals, :right_kidney_other, :text
    add_column :internals, :left_kidney_other, :text
  end
end
