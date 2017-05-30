class AddMoreColumnsToInternal8 < ActiveRecord::Migration
  def change
    add_column :internals, :lymphatic_system_anomalies_specify, :text
  end
end
