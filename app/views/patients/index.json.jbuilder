json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :dob, :case, :hospital, :age, :date_admission, :race, :sex, :pathologist, :physician, :attendant, :date_autopsy, :time_of_autopsy, :restrictions, :prosector
  json.url patient_url(patient, format: :json)
end
