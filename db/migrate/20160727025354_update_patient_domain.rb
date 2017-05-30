class UpdatePatientDomain < ActiveRecord::Migration
  def change
    change_column :patients, :dob, :date
    change_column :patients, :date_admission, :date
    change_column :patients, :date_autopsy, :date
  end
end
