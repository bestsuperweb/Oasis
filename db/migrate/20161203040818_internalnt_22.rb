class Internalnt22 < ActiveRecord::Migration
  def change
    add_column :internals, :heart_configuration, :string
    add_column :internals, :heart_configuration_specify, :text
  end
end
