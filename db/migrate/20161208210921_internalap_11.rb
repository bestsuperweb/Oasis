class Internalap11 < ActiveRecord::Migration
  def change
    add_column :internals, :pancreas_size_configuration_specify, :text
  end
end
