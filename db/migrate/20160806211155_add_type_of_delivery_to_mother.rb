class AddTypeOfDeliveryToMother < ActiveRecord::Migration
  def change
    add_column :mother_data, :type_of_delivery, :string
  end
end
