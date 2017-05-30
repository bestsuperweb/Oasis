class AddTimeOfBirthToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :time_of_birth, :time
  end
end
