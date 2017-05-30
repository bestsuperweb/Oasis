class InternalhnController < ApplicationController

  before_action :set_internal, only: [:show, :edit, :update, :destroy]

  def new
	  @description = Description.find(params[:id])

	  if @description.internal.nil?
	    @internal = Internal.new
	  else
	    respond_to do |format|
	     format.html { redirect_to "#{description_path}#internal", notice: 'External record is already present' }
	    end
	  end
          authorize! :create, @description.internal
  end

  def show
  end

  def edit
      @description = Description.find(params[:id])
      @internal = @description.internal
      authorize! :update, @description.internal
  end

  def create
    @description = Description.find(params[:id])
    @description.internal = Internal.new(internal_params)
    authorize! :create, @description.internal

    respond_to do |format|
      if @description.internal.save 
	format.html { redirect_to "#{description_path}#internalhn", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.internal}
      else
        format.html { render :new }
        format.json { render json: @description.internal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @description.internal
    respond_to do |format|
      if @description.internal.update(internal_params)
        format.html { redirect_to "#{description_path}#internalhn", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.internal }
      else
        format.html { render :edit }
        format.json { render json: @description.internal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal
      @description = Description.find(params[:id])
      @internal = @description.internal
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_params
      params.require(:internal).permit(:blood_vessels, :blood_vessels_specify, :brain_consistency, :brain_consistency_specify, :brain_other, :brain_weight, :configuration_lobar_pattern, :configuration_lobar_pattern_specify, :cord_proper, :cord_proper_specify, :cranial_nerves, :cranial_nerves_specify, :cranium_other, :dura_falx_tentorium, :dura_falx_tentorium_specify, :ears_removed, :ears_removed_specify, :epidural_space, :epidural_space_specify, :extradural_space, :extradural_space_specify, :foramen_magnum_antero_lateral_dimension, :foramen_magnum_antero_posterior_dimension, :kernicterus, :kernicterus_specify, :meninges, :meninges_specify, :pachymeninges, :pachymeninges_specify, :periosteum, :periosteum_specify, :petrous_pyramids_opened_and_cultured, :petrous_pyramids_opened_and_cultured_specify, :pituitary_external_surface, :pituitary_external_surface_specify, :pituitary_other, :pituitary_parenchyma_or_cut_surface, :pituitary_parenchyma_or_cut_surface_specify, :pituitary_pos_config_shape, :pituitary_pos_config_shape_specify, :pituitary_weight, :sella, :sella_specify, :sinuses_other, :skull_base, :skull_base_specify, :subcutaneous_galea, :subcutaneous_galea_specify, :subdural_epidural, :subdural_epidural_specify, :sutures_fontanelles, :sutures_fontanelles_specify, :venous_sinuses, :venous_sinuses_specify,:brain_preliminary_examination_normal, :dura_and_venous_sinuses_normal, :pituitary_normal, :scalp_and_cranium_normal, :spinal_cord_normal, :description)
      
      
    end
end
