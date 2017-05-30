class Internal27 < ActiveRecord::Migration
  def change
    add_column :internals, :block_code_composite, :text
  end
end
