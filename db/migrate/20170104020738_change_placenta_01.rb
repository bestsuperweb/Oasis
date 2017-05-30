class ChangePlacenta01 < ActiveRecord::Migration
  def change
    change_column :placenta, :weight, :float
    change_column :placenta, :total_length, :float
  end
end
