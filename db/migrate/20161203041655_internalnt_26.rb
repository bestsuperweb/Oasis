class Internalnt26 < ActiveRecord::Migration
  def change
     add_column :internals,:pulmonary_veins, :string
     add_column :internals,:pulmonary_veins_specify, :text
     #add_column :internals,:ductus, :string
     #add_column :internals,:coronary_arteries, :string
     #add_column :internals,:ductus_specify, :text
     #add_column :internals,:coronary_arteries_specify, :text
  end
end
