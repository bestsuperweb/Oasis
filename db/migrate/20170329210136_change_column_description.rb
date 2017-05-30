class ChangeColumnDescription < ActiveRecord::Migration
  def change
    remove_column :descriptions, :user_id
  end
end
