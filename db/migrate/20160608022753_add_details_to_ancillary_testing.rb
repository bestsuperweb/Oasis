class AddDetailsToAncillaryTesting < ActiveRecord::Migration
  def change
    add_column :ancillary_testings, :microbiology_specify, :string
    add_column :ancillary_testings, :viral_culture_specify, :string
    add_column :ancillary_testings, :karyotype_requested_specify, :string
    add_column :ancillary_testings, :electron_microscopy_specify, :string
  end
end
