class AddHeigtsToMotherDatum < ActiveRecord::Migration
  def change
    add_column :mother_data, :height, :integer
    add_column :mother_data, :height_unit, :string
    add_column :mother_data, :pre_pregnancy_bmi, :float         
    add_column :mother_data, :delivery_bmi, :float          
    add_column :mother_data, :pre_pregnancy_weight_unit, :float       
    add_column :mother_data, :delivery_weight_unit, :string        
    add_column :mother_data, :amniocentesis_explain, :string        
    add_column :mother_data, :feto_placental_findings_at_the_time_of_delivery,:string 
    add_column :mother_data, :birth_weight_unit, :string         
    add_column :mother_data, :placenta, :string          
    add_column :mother_data, :placenta_specify, :string        
    add_column :mother_data, :amniotic_fluid_specify, :string
  end 
end









