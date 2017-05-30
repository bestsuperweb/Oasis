class Internal30 < ActiveRecord::Migration
  def change
    add_column :internals, :brain_md, :text
    add_column :internals, :cranium_md, :text
    add_column :internals, :dura_and_venous_sinuses_md, :text
    add_column :internals, :pituitary_md, :text
    add_column :internals, :spinal_cord_md, :text
  end
end
