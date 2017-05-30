class AddSecretaryToUser < ActiveRecord::Migration
  def change
    add_column :users, :secretary, :boolean
  end
end
