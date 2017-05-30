class CreateAncillaryTestings < ActiveRecord::Migration
  def change
    create_table :ancillary_testings do |t|
      t.string :microbiology
      t.string :viral_culture
      t.string :karyotype_requested
      t.string :electron_microscopy
      t.string :molecular_diagnostic_pathology
      t.string :specimens_snap_frozen
      t.string :post_mortem_x_rays
      t.string :photographs
      t.string :organs_for_special_study
      t.string :other
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
