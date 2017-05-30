class Internalhn9 < ActiveRecord::Migration
  def change
    add_column :internals, :brain_preliminary_examination_normal, :boolean
  end
end
