class External20 < ActiveRecord::Migration
  def change
    add_column :externals, :pupils_specify, :text
  end
end
