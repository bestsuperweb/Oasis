class AddNodeMassSpecifyToExternal < ActiveRecord::Migration
  def change
    add_column :externals, :nodes_masses_specify, :string
  end
end
