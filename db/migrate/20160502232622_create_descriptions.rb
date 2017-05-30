class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :user_id
      t.text :description

      t.timestamps null: false
    end
  end
end
