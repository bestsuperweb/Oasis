class AddPhysicianToUser < ActiveRecord::Migration
  def change
    add_column :users, :physician, :boolean
  end
end
