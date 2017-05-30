class Internalap15 < ActiveRecord::Migration
  def change
    add_column :internals, :accessory_spleens_specify, :text
  end
end
