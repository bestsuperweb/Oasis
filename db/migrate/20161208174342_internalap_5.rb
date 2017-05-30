class Internalap5 < ActiveRecord::Migration
  def change
    add_column :internals, :small_intestine_mesentery, :string
    add_column :internals, :small_intestine_mesentery_specify, :string
  end
end
