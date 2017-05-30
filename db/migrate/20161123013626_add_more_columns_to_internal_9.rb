class AddMoreColumnsToInternal9 < ActiveRecord::Migration
  def change
    add_column :internals, :peripheral_nervous_system_specify, :text
  end
end
