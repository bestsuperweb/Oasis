class AddMoreColumnsToInternal2 < ActiveRecord::Migration
  def change
    add_column :internals, :skeletal_muscle_color_specify, :text
  end
end
