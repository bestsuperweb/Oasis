class CorrectDomainOfPrePregnancyWeightUnit < ActiveRecord::Migration
  def up
    change_column :mother_data, :height, :float
    change_column :mother_data, :pre_pregnancy_weight_unit, :string
  end
  def down
    change_column :mother_data, :height, :integer
    change_column :mother_data, :pre_pregnancy_weight_unit, :float
  end
end
