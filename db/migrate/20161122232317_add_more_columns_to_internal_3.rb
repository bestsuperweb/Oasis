class AddMoreColumnsToInternal3 < ActiveRecord::Migration
  def change
    add_column :internals, :skeletal_muscle_consistency_specify, :text
  end
end
