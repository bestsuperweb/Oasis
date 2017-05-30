class Internalap10 < ActiveRecord::Migration
  def change
    add_column :internals, :pancreas_size_configuration, :string
  end
end
