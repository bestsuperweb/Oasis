class Internalap19 < ActiveRecord::Migration
  def change
    add_column :internals, :bladder_and_urethra_other, :text
  end
end
