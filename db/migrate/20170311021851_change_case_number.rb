class ChangeCaseNumber < ActiveRecord::Migration
  def change
    change_column :patients, :case, :string 
  end
end
