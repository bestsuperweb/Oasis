class CreateFinalReports < ActiveRecord::Migration
  def change
    create_table :final_reports do |t|
    	t.string :report      
        t.string :assign
        t.string :lock
        t.string :flag
        t.references :description, index: true, foreign_key: true
        t.timestamps null: false
    end
   end
end