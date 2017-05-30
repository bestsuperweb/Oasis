class AddLivingToMotherDatumOneMoreTime < ActiveRecord::Migration
  def change
    add_column :mother_data, :living, :string
  end
end
