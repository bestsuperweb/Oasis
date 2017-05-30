class UpdateTimeDomain < ActiveRecord::Migration
  def change
    change_column :patients, :time_of_birth, :string
    change_column :patients, :time_of_autopsy , :string
  end
end
