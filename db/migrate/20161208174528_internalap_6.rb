class Internalap6 < ActiveRecord::Migration
  def change
    add_column :internals, :small_intestine_other, :string
  end
end
