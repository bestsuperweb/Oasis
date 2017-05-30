class ConnectBodyMeasuremntToDescription < ActiveRecord::Migration
  def change
    remove_reference :body_measurements , :patient
    add_reference :body_measurements, :description , index: true
  end
end
