class AddMoreColumnsToInternal5 < ActiveRecord::Migration
  def change
    add_column :internals, :arterial_system_state_of_distension_specify, :string
  end
end
