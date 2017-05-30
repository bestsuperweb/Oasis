class Internalhn10 < ActiveRecord::Migration
  def change
    add_column :internals, :brain_other ,  :text
  end
end
