class CreateBlockCodes < ActiveRecord::Migration
  def change
    create_table :block_codes do |t|
      t.integer :block_number
      t.text :block_description
      t.belongs_to :description, index: true

      t.timestamps null: false
    end
  end
end
