class Internalnt23 < ActiveRecord::Migration
  def change
    add_column :internals ,:heart_content, :string
    add_column :internals ,:heart_content_specify, :string
  end
end
