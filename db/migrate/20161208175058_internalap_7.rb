class Internalap7 < ActiveRecord::Migration
  def change
   add_column :internals, :large_intestine_mesentery, :string 
   add_column :internals, :large_intestine_mesentery_specify, :text
   add_column :internals, :large_intestine_other, :text
  end
end
