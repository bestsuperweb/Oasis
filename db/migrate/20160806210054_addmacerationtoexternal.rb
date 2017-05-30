class Addmacerationtoexternal < ActiveRecord::Migration
  def change
    add_column :externals, :degree_of_maceration, :string
  end
end
