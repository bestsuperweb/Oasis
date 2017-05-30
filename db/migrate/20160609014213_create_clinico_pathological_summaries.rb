class CreateClinicoPathologicalSummaries < ActiveRecord::Migration
  def change
    create_table :clinico_pathological_summaries do |t|
      t.string :clinpath_summary
      t.string :references
      t.references :description, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
