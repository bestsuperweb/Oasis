class Internalap3 < ActiveRecord::Migration
  def change
    add_column :internals, :meckel_diverticulum, :string
  end
end
