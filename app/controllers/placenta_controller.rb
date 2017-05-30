class PlacentaController < ApplicationController
  before_action :set_placenta, only: [:show, :edit, :update, :destroy]

  def new
	  @description = Description.find(params[:id])
	  if @description.placenta.nil?
	    @placenta = Placenta.new
	  else
	    respond_to do |format|
	     format.html { redirect_to placenta_path, notice: 'Placenta record is already present' }
	    end
	  end
    @patient     = @description.patient
    @final_report = @description.final_report.build
	  authorize! :create, @description.placenta
  end

  def show
    @description = Description.find(params[:id])
    @placenta = @description.placenta
    @patient     = @description.patient
    @final_report = @description.final_report
  end

  def edit
      @description = Description.find(params[:id])
      @placenta = @description.placenta
      @patient     = @description.patient
      authorize! :update, @description.placenta
  end

  def create
    @description = Description.find(params[:id])
    @description.placenta = Placenta.new(placenta_params)
    authorize! :create, @description.placenta

    respond_to do |format|
      if @description.placenta.save 
	format.html { redirect_to "#{description_path}#placenta", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.placenta}
      else
        format.html { render :new }
        format.json { render json: @description.placenta.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @description.placenta
    respond_to do |format|
      if @description.placenta.update(placenta_params)
        format.html { redirect_to "#{description_path}#placenta", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.placenta }
      else
        format.html { render :edit }
        format.json { render json: @description.placenta.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_placenta
      @description = Description.find(params[:id])
      @placenta = @description.placenta
    end

    def placenta_params
      params.require(:placenta).permit(:weight, :placental_weight_ratio, :total_length, :vessels, :umbillical_cord_normal, :normal_no_funisitis, :normal_no_acute_vasculitis, :umbillical_cord_normal_no_other, :fetal_memberanes_normal, :normal_no_acute_chorioamnionitis, :normal_no_pigmented_macrophages, :fetal_membranes_normal_no_other, :chorionic_plate_and_stem_vessels_normal, :normal_no_acute_vasculitis, :normal_no_thrombosis, :normal_no_hemorrhagic_endovasculosis, :normal_no_cushion_lesions_with_or_without_fibrin, :chorionic_plate_and_stem_vessels_normal_no_other, :maturation_appropriate_for_gestational_age, :maturation_no_specify, :chorionic_villi_and_intervillous_space_normal, :chorionic_villi_abnormal_chronic_lymphohistiocytic_villitis, :chorionic_villi_abnormal_acute_intervillositis, :chorionic_villi_abnormal_avascular_villi, :chorionic_villi_abnormal_other, :basal_plate_normal, :normal_no_maternal_vessels_normal, :normal_no_decidua_basalis_normal, :normal_no_basalplate_other, :normal_no_maternal_vessels_normal_specify, :normal_no_decidua_basalis_normal_specify, :description, :placentation, :gross_description)
    end
end
