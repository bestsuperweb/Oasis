class InternalntController < ApplicationController

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
	format.html { redirect_to "#{description_path}#internalnt", notice: 'Patients exteral data is successfully created.' }
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
        format.html { redirect_to "#{description_path}#internalnt", notice: 'Patient was successfully updated.' }
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
      params.require(:internal).permit( :aortic_valve, :aortic_valve_circumference, :aortic_valve_specify, :arch_branches, :arch_branches_specify, :arch_configuartion, :arch_configuartion_specify, :atrial_septum, :atrial_septum_specify, :atrial_situs, :atrial_situs_specify, :bilateral, :bronchial_tree, :bronchial_tree_specify, :chambers_and_septae_normal, :combined_heart_and_lungs_weight, :congestion, :coronary_arteries, :coronary_arteries_specify, :cut_surface, :cut_surface_specify, :diaphragm_normal, :diaphragm_other, :diaphragm_position_configuration, :diaphragm_position_configuration_specify, :diphragm_defect, :ductus, :ductus_specify, :endocardium, :endocardium_specify, :epicardium, :epicardium_specify, :epiglottis, :epiglottis_specify, :esophagus_mucosa_and_wall, :esophagus_mucosa_and_wall_specify, :esophagus_normal, :esophagus_other, :esophagus_size_position_configuration, :esophagus_size_position_configuration_specify, :fixed_by_perfusion, :fixed_by_perfusion_specify, :foreign_material_in_lumen, :foreign_material_in_lumen_specify, :heart_configuration, :heart_configuration_specify, :heart_content, :heart_content_specify, :heart_normal, :heart_only_weight, :heart_position, :heart_position_specify, :heart_shape, :heart_shape_specify, :heart_size, :heart_size_specify, :hilar_nodes, :hilar_nodes_specify, :inferior_vena_cava, :inferior_vena_cava_specify, :interstitial_emphysema, :intima_and_wall, :intima_and_wall_specify, :larynx_and_trachea_normal, :larynx_other, :larynx_trachea_configuration_position, :larynx_trachea_configuration_position_specify, :left_lung_weight, :left_ventricular_wall_thickness, :lobar_pattern, :lobar_pattern_specify, :lung_to_body_weight_ratio, :lungs_consistency, :lungs_consistency_specify, :lungs_normal, :mediastinum_nodes_masses, :mediastinum_nodes_masses_specify, :mediastinum_normal, :mediastinum_other, :mediastinum_position_configuration, :mediastinum_position_configuration_specify, :mitral_valve, :mitral_valve_circumference, :mitral_valve_specify, :mucosal_surfaces, :mucosal_surfaces_specify, :myocardium, :myocardium_specify, :origins_of_aorta_and_pulmonary_artery, :origins_of_aorta_and_pulmonary_artery_specify, :parathyroid_gland, :parathyroid_gland_specify, :parenchyma_color, :parenchyma_color_specify, :pericardial_sac_amount_of_fluid, :pericardial_sac_amount_of_fluid_specify, :pericardial_sac_contents, :pericardial_sac_contents_specify, :pericardial_sac_normal, :petechiae_on_external_surface, :pleural_cavities_amount_of_fluid, :pleural_cavities_amount_of_fluid_specify, :pleural_cavities_normal, :pleural_cavities_other, :pleural_cavity_organ_relations, :pleural_cavity_organ_relations_specify, :pleural_nature_of_fluid, :pleural_nature_of_fluid_specify, :pleural_petechiae, :pleural_serosal_surfaces, :pleural_serosal_surfaces_specify, :pneumomediastinum, :pneumothorax, :pneumothorax_specify, :pulmonary_arteries, :pulmonary_arteries_specify, :pulmonary_veins, :pulmonary_veins_specify, :pulmonic_valave_circumference, :pulmonic_valve, :pulmonic_valve_specify, :right_lungs_weight, :right_ventricular_wall_thickness, :serosal_sarfaces, :serosal_sarfaces_specify, :state_of_expansion, :state_of_expansion_specify, :superior_vena_cava, :superior_vena_cava_specify, :thoracic_branches, :thoracic_branches_specify, :thymus_normal, :thymus_other, :thymus_pos_config_shape, :thymus_pos_config_shape_specify, :thyroid_external_surface, :thyroid_external_surface_specify, :thyroid_other, :thyroid_parathyroid_normal, :thyroid_parenchyma_or_cut_surface, :thyroid_parenchyma_or_cut_surface_specify, :thyroid_pos_config_shape, :thyroid_pos_config_shape_specify, :thyroid_weight, :tracheal_rings, :tracheastomy, :tricuspid_valve, :tricuspid_valve_circumference, :tricuspid_valve_specify, :valves_normal, :ventricular_septum, :ventricular_septum_specify, :ventricular_situs, :ventricular_situs_specify, :vessels, :vessels_and_ducts_normal, :vessels_specify, :visceral_pleura, :visceral_pleura_specify, :vocal_cords, :vocal_cords_specify, :weight, :description)
      
      
    end
end
