class Internalnt15 < ActiveRecord::Migration
  def change
     add_column :internals, :diaphragm_position_configuration, :string
     add_column :internals, :diaphragm_position_configuration_specify, :text
  end
end
