class Internalnt25 < ActiveRecord::Migration
  def change
    add_column :internals, :superior_vena_cava, :string
    add_column :internals, :superior_vena_cava_specify, :text
    add_column :internals, :inferior_vena_cava, :string
    add_column :internals, :inferior_vena_cava_specify, :text
  end
end
