class Description < ActiveRecord::Base
	has_one :patient
	has_one :mother_datum
	has_one :external
	has_one :internal
	has_one :ancillary_testing
	has_one :clinico_pathological_summary
	has_one :question_answer
	has_one :placenta
	has_one :body_measurement
	has_one :provisional_diagnosis
	has_one :final_diagnosis
	has_many :special_reports
	has_one :final_report
	#has_many :block_codes
	belongs_to :user
end
