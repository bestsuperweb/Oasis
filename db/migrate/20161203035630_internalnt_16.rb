class Internalnt16 < ActiveRecord::Migration
  def change
    add_column :internals, :diphragm_defect, :string
  end
end
