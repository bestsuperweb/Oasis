class External21 < ActiveRecord::Migration
  def change
    add_column :externals, :patency_of_choanae_specify, :text
  end
end
