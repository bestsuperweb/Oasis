class AddDescriptionIdToPatients < ActiveRecord::Migration
  def change
	  add_reference :patients, :description
  end
end
