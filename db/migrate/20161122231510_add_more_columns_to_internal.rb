class AddMoreColumnsToInternal < ActiveRecord::Migration
  def change
    add_column :internals, :skeletal_muscle_color, :string
  end
end
