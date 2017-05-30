class Internalhn3 < ActiveRecord::Migration
  def change
    add_column :internals, :periosteum, :string
    add_column :internals, :periosteum_specify, :text
  end
end
