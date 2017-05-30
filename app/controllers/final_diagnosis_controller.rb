class FinalDiagnosisController < ApplicationController
  before_action :set_description , 
                  only: [:show, :edit, :update, :destroy, :new, :create]

  def new
	  if @description.final_dignosis.nil?
	    @final_dignosis = FinalDiagnosis.new
	  else
	     redirect_to "#{description_path}#final"
	  end
	  authorize! :create, @description.final_diagnosis
  end

  def create

    @description.final_diagnosis = FinalDiagnosis.new(final_diagnosis_params)
    authorize! :create, @description.final_diagnosis

    respond_to do |format|
      if @description.final_diagnosis.save 
	format.html { redirect_to "#{description_path}#final", notice: 'Patients exteral data is successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
      @final_diagnosis = @description.final_diagnosis
      authorize! :update, @description.final_diagnosis
  end

  def update
    authorize! :update, @description.final_diagnosis
    respond_to do |format|
      if @description.final_diagnosis.update(final_diagnosis_params)
        format.html { redirect_to "#{description_path}#final", notice: 'Final diagnosis updated' }
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

  def final_diagnosis_params
    params.require("final_diagnosis").permit(:report, :description, :status)
  end


end
