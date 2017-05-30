class AddMoreColumnsToInternal4 < ActiveRecord::Migration
  def change
     add_column :internals, :cervical_specify, :text
     add_column :internals, :axillary_specify, :text
     add_column :internals, :mediastinal_specify, :text
     add_column :internals, :hilar_specify, :text
     add_column :internals, :celiac_peripancreatic_specify, :text
     add_column :internals, :mesenteric_specify, :text
     add_column :internals, :periaortic_specify, :text
     add_column :internals, :iliac_specify, :text
     add_column :internals, :inguinal_specify, :text
  end
end

