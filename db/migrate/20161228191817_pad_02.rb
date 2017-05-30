class Pad02 < ActiveRecord::Migration
  def change
    add_column :provisional_diagnoses, :status, :string
  end
end
