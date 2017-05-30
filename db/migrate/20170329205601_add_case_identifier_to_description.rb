class AddCaseIdentifierToDescription < ActiveRecord::Migration
  def change
    add_column :descriptions, :case_identifier, :string
  end
end
