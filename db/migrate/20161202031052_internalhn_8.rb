class Internalhn8 < ActiveRecord::Migration
  def change
    add_column :internals, :epidural_space, :string
    add_column :internals, :epidural_space_specify, :string
  end
end
