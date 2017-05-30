class DropBodyMeasurementsTable < ActiveRecord::Migration
  def change
    drop_table :body_measurements
  end
end
