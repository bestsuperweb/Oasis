class Internalap2 < ActiveRecord::Migration
  def change
    add_column :internals, :stomach_and_duodenum_other, :boolean
  end
end
