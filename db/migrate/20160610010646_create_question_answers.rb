class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.string :major_clinical_diagnosis
      t.string :major_pathologic_diagnosis
      t.string :clinical_cause_of_death
      t.string :pathological_cause_of_death
      t.string :discover_a_discrepancy_between_clinical_and_pathologic_diagnosis
      t.string :establish_an_unexpected_additional_diagnosis
      t.string :confirm_the_major_clinical_diagnosis
      t.string :information_relevant_to_genetic_counselling
      t.string :information_relevant_to_treatment_effect
      t.string :information_on_diagnostic_procedures
      t.string :information_relevant_to_previous_lab_or_anatomic_pathology_data
      t.string :are_all_parts_of_the_report_complete
      t.string :are_the_descriptions_clear
      t.string :are_all_gross_abnormalities_confirmed_microscopically
      t.string :are_all_appropriate_special_studies_done_and_reported
      t.string :diagnoses_justified_on_anatomic_evidence_scroll_down_menu_saying
      t.string :diagnoses_complete
      t.string :diagnosis_organized_and_sequenced_by_pathogenetic_significance
      t.string :transcriptional_or_typographical_errors
      t.string :clinically_relevant_postmortem_findings_addressed_in_cpc
      t.string :comments_and_recommendations
      t.string :reviewed_by
      t.string :date
      t.references :description, index: true, foreign_key: true
      t.string :are_all_appropriate_special_studies_done_and_reported_specify

      t.timestamps null: false
    end
  end
end
