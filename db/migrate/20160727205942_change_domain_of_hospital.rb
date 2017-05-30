class ChangeDomainOfHospital < ActiveRecord::Migration
  def change
    change_column :patients, :hospital, :string
  end
end
