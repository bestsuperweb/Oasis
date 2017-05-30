class Internalnt24 < ActiveRecord::Migration
  def change
   add_column :internals, :thoracic_branches, :string
   add_column :internals, :thoracic_branches_specify, :text
  end
end
