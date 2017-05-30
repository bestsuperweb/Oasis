class ProvisionalDiagnosisController < ApplicationController

  before_action :set_description , 
                  only: [:show, :edit, :update, :destroy, :new, :create]

  def new
	  if @description.provisional_dignosis.nil?
	    @provisional_dignosis = ProvisionalDiagnosis.new
	  else
	     redirect_to "#{description_path}#provisional"
	  end
	  authorize! :create, @description.provisional_diagnosis
  end

  def create

    @description.provisional_diagnosis = ProvisionalDiagnosis.new(provisional_diagnosis_params)
    authorize! :create, @description.provisional_diagnosis

    respond_to do |format|
      if @description.provisional_diagnosis.save 
	format.html { redirect_to "#{description_path}#provisional", notice: 'Patients exteral data is successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
      @provisional_diagnosis = @description.provisional_diagnosis
      authorize! :update, @description.provisional_diagnosis
  end

  def update
    authorize! :update, @description.provisional_diagnosis
    respond_to do |format|
      if @description.provisional_diagnosis.update(provisional_diagnosis_params)
        format.html { redirect_to "#{description_path}#provisional", notice: 'Provisional diagnosis updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  private 

  def set_description
    @description = Description.find(params[:id])
  end

  def provisional_diagnosis_params
    params.require("provisional_diagnosis").permit(:report, :description, :status)
  end


end

#<MotherDatum id: 1, mother_age: 23, gestational_age: nil, prenatal_care: "Yes", gravida: 1, para: 1, abortus: 1, term: 1, pre_pregnancy_weight: nil, delivery_weight: nil, blood_type: "Unknown", antibody_screen: "negative", rpr: "reactive", hepatitis_b: "negative", rubella: "immune", HIV: "negative", diabetes: "gestational", GBS: "negative", amniocentesis: "", previous_pregnancy_summary: "", present_pregnancy_summary: "", ultrasound_finding: "", birth_weight: nil, maceration_degree: nil, gross_appearance: "normal", placenta_available_for_examination: nil, amniotic_fluid: "", mother_medical_history: "", description_id: 4, created_at: "2016-08-15 15:27:13", updated_at: "2016-08-15 15:27:13", living: "1", height: nil, height_unit: "inches", pre_pregnancy_bmi: nil, delivery_bmi: nil, pre_pregnancy_weight_unit: "Lb", delivery_weight_unit: "Lb", amniocentesis_explain: nil, feto_placental_findings_at_the_time_of_delivery: nil, birth_weight_unit: "lb/oz", placenta: "", placenta_specify: nil, amniotic_fluid_specify: nil, type_of_delivery: "", type_of_delivery_specify: nil>
