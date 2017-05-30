class CreateOrganWeights < ActiveRecord::Migration
  def change
    create_table :organ_weights do |t|
      t.integer :brain_expected
      t.integer :brain_observed
      t.integer :heart_expected
      t.integer :heart_observed
      t.integer :liver_expected
      t.integer :liver_observed
      t.integer :lt_adrenal_expected
      t.integer :lt_adrenal_observed
      t.integer :lt_kidney_expected
      t.integer :lt_kidney_observed
      t.integer :lt_lung_expected
      t.integer :lt_lung_observed
      t.integer :rt_adrenal_expected
      t.integer :rt_adrenal_observed
      t.integer :rt_kidney_expected
      t.integer :rt_kidney_observed
      t.integer :rt_lung_expected
      t.integer :rt_lung_observed
      t.integer :spleen_expected
      t.integer :spleen_observed
      t.integer :thymus_expected
      t.integer :thymus_observed
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
