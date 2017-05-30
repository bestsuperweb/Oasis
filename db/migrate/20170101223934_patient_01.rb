class Patient01 < ActiveRecord::Migration
  def change
    add_column :patients, :age_day_week , :integer 
  end
end
