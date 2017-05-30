class InternalController < ApplicationController

  #helper_method :parse_text
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

  def hn_edit
      @description = Description.find(params[:id])
      @internal = @description.internal
  end

  def create
    @description = Description.find(params[:id])
    @description.internal    = Internal.new(internal_params)
    authorize! :create, @description.internal

    respond_to do |format|
      if @description.internal.save 
	format.html { redirect_to "#{description_path}#internal", notice: 'Patients exteral data is successfully created.' }
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
        format.html { redirect_to "#{description_path}#internal", notice: 'Patient was successfully updated.' }
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
      params.require(:internal).permit(:arterial_system_anomalies, :arterial_system_anomalies_specify, :arterial_system_contents, :arterial_system_other, :arterial_system_state_of_distension, :arterial_system_state_of_distension_specify, :axillary, :axillary_specify, :bone_anomalies, :bone_anomalies_specify, :bones_other, :celiac_peripancreatic, :celiac_peripancreatic_specify, :cervical, :cervical_specify, :fat, :hardness, :hardness_specify, :hilar, :hilar_specify, :hydration, :iliac, :iliac_specify, :inguinal, :inguinal_specify, :lymph_nodes_other, :lymphatic_system_anomalies, :lymphatic_system_anomalies_specify, :lymphatic_system_contents, :lymphatic_system_other, :lymphatic_system_state_of_distension, :lymphatic_system_state_of_distension_specify, :marrow, :marrow_specify, :mediastinal, :mediastinal_specify, :mesenteric, :mesenteric_specify, :periaortic, :periaortic_specify, :peripheral_nervous_system, :peripheral_nervous_system_specify, :skeletal_muscle_color, :skeletal_muscle_color_specify, :skeletal_muscle_consistency, :skeletal_muscle_consistency_specify, :skeletal_muscle_other, :skeletal_muscle_size, :skeletal_muscle_size_specify, :subcutaneous_other, :venous_system_anomalies, :venous_system_anomalies_specify, :venous_system_contents, :venous_system_other, :venous_system_state_of_distension, :venous_system_state_of_distension_specify, :subcutaneous_normal, :bones_normal, :skeletal_muscle_normal, :lymphnodes_normal, :venous_system_normal, :arterial_system_normal, :lymphatic_system_normal, :description, :block_code_composite, :arterial_system_md, :bone_md, :lymphatic_system_md, :peripheral_nervous_system_md, :skeletal_muscle_md, :subcutaneous_md, :venous_system_md, :brain_md, :cranium_md, :dura_and_venous_sinuses_md, :pituitary_md, :spinal_cord_md, :chambers_and_septae_md, :diaphragm_md, :esophagus_md, :heart_md, :larynx_md, :lungs_md, :mediastinum_md, :pericardial_sac_md, :pleural_cavities_md, :thymus_md, :thyroid_pt_md, :valves_md, :vessels_and_ducts_md,:bladder_and_urethra_md, :female_genetalia_md, :large_intestine_md, :left_adrenal_gland_md, :left_kidney_ureter_md, :liver_and_biliary_system_md, :male_genetalia_md, :pancreas_md, :peritoneal_cavity_md, :right_adrenal_gland_md, :right_kidney_and_ureter_md, :small_intesting_md, :spleen_md, :stomach_and_duodenum_md)
    end

end
