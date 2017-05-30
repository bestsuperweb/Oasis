class ChangeDateToStringPatient < ActiveRecord::Migration
  def change
    change_column :patients, :dob , :string
    change_column :patients, :date_admission , :string
    change_column :patients, :date_autopsy, :string
  end
end
