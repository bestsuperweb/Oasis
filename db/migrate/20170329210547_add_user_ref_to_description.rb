class AddUserRefToDescription < ActiveRecord::Migration
  def change
    add_reference :descriptions, :user, index: true, foreign_key: true
  end
end
