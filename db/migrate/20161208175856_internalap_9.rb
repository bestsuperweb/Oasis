class Internalap9 < ActiveRecord::Migration
  def change
    add_column :internals, :liver_and_biiary_system_other, :text
  end
end
