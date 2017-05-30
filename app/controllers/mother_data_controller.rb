class MotherDataController < ApplicationController
  #before_action :set_patient, only: [:show, :edit, :update, :destroy]
	#
  def index
    @descriptions = Description.all
  end

  def show
	  @description = Description.find(params[:id])
          @patient     = @description.mother_datum
	  authorize! :see, @description.mother_datum
  end

  def new
	  @description = Description.find(params[:id])

	  if @description.mother_datum.nil?
	    @mother_datum = MotherDatum.new
	  else
	    respond_to do |format|
	     format.html { redirect_to mother_datum_path, notice: 'Patients mother datum is Already Generated.' }
	    end
	  end
	  authorize! :create, @description.mother_datum
  end

  def edit
     @description = Description.find(params[:id])
     authorize! :update, @description.mother_datum
     @mother_datum     = @description.mother_datum
  end

  def create
    @description = Description.find(params[:id])
    @description.mother_datum = MotherDatum.new(params[:mother_datum].permit([:mother_age, :gestational_age, :prenatal_care, :gravida, :para, :abortus, :term, :pre_pregnancy_weight, :delivery_weight, :blood_type, :antibody_screen, :rpr, :hepatitis_b, :rubella, :HIV, :diabetes, :GBS, :amniocentesis, :previous_pregnancy_summary, :present_pregnancy_summary, :ultrasound_finding, :birth_weight, :maceration_degree, :gross_appearance, :placenta_available_for_examination, :amniotic_fluid, :mother_medical_history, :description, :living, :height, :feto_placental_findings_at_the_time_of_delivery, :pre_pregnancy_bmi, :delivery_bmi, :height_unit, :pre_pregnancy_weight_unit, :delivery_weight_unit, :amniocentesis_explain, :birth_weight_unit, :placenta_specify, :amniotic_fluid_specify , :placenta, :type_of_delivery , :type_of_delivery_specify]))
    #Description.find(params[:id])
    authorize! :create, @description.mother_datum

    respond_to do |format|
      if @description.mother_datum.save

	format.html { redirect_to "#{description_path}#mother", notice: 'Patients Organ weight is  successfully created.' }
	format.json { render :show, status: :ok, location: @description.mother_datum }
      else
        format.html { render :new }
        format.json { render json: @description.mother_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @description = Description.find(params[:id])
    authorize! :update, @description.mother_datum
    respond_to do |format|
      if @description.mother_datum.update(params[:mother_datum].permit([:mother_age, :gestational_age, :prenatal_care, :gravida, :para, :abortus, :term, :pre_pregnancy_weight, :delivery_weight, :blood_type, :antibody_screen, :rpr, :hepatitis_b, :rubella, :HIV, :diabetes, :GBS, :amniocentesis, :previous_pregnancy_summary, :present_pregnancy_summary, :ultrasound_finding, :birth_weight, :maceration_degree, :gross_appearance, :placenta_available_for_examination, :amniotic_fluid, :mother_medical_history, :description, :living, :height, :feto_placental_findings_at_the_time_of_delivery, :pre_pregnancy_bmi, :delivery_bmi, :height_unit, :pre_pregnancy_weight_unit, :delivery_weight_unit, :amniocentesis_explain, :birth_weight_unit, :placenta_specify, :amniotic_fluid_specify, :placenta, :type_of_delivery , :type_of_delivery_specify]))

        format.html { redirect_to "#{description_path}#mother", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.mother_datum }
      else
        format.html { render :edit }
        format.json { render json: @description.mother_datum.errors, status: :unprocessable_entity }
      end
    end
  end
end
