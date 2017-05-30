class AddMoreColumnsToInternal6 < ActiveRecord::Migration
  def change
    add_column :internals, :arterial_system_anomalies_specify, :string
  end
end
