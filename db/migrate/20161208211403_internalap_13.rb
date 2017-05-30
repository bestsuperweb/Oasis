class Internalap13 < ActiveRecord::Migration
  def change
    add_column :internals, :pancreas_other, :text
  end
end
