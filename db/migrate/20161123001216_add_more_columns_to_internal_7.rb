class AddMoreColumnsToInternal7 < ActiveRecord::Migration
  def change
    add_column :internals, :lymphatic_system_state_of_distension_specify, :string
    #add_column :internals, :lymphatic_system_anomalies, :string
  end
end
