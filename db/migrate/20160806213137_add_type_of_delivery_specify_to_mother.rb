class AddTypeOfDeliverySpecifyToMother < ActiveRecord::Migration
  def change
    add_column :mother_data, :type_of_delivery_specify, :string
  end
end
