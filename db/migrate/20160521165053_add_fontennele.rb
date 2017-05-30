class AddFontennele < ActiveRecord::Migration
  def change
    add_column :externals, :anterior_fontanelle_measurement, :string
  end
end
