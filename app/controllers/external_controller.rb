class ExternalController < ApplicationController
  def show
    @description = Description.find(params[:id])
    #@external    = @description.externals
    #@description.external.weight = weight
    #@description.external.weight = weight["bwa"]
    authorize! :see, @description.external
  end

  def new
    @description = Description.find(params[:id])

    if @description.external.nil?
      @external = External.new
    else
      respond_to do |format|
	format.html { redirect_to "#{description_path}#external", notice: 'External record is already present' }
      end
    end

    authorize! :create, @description.external
  end

  def edit
    @description = Description.find(params[:id])
    @external     = @description.external
    authorize! :update, @description.external
  end

  def create
    @description = Description.find(params[:id])
    @description.external = External.new(params[:external].permit([:nutrition,:hydration_including_edema,:facies,:embalmed,:rigor,:livor,:cyanosis,:icterus,:tubes,:catheters,:needle_marks,:incisions_scars,:rash_excoriation,:petechiae,:ecchymoses,:nevi_angiomas,:configuration_size,:hair_color,:scalp_subcutaneous,:scalp_subgaleal,:calvarium_sutures,:anterior_fontanelle,:head_other,:position,:shape,:canals,:ears_other,:size_shape_position,:lids_periorbital_soft_tissue,:conjunctiva,:sclera_cornea_lens,:iris_color,:pupils,:pupils_specify,:eyes_removed,:eyes_other,:position_shape,:nares_exudate,:patency_of_choanae,:septum,:nose_other,:lips_mucosa_gums,:tongue,:palate_maxilla_mandible,:teeth_upper,:teeth_lower,:tonsils,:salivary_glands,:pharynx,:mouth_other,:neck_configuration,:nodes_masses,:neck_other,:axilla_configuration,:axillary_lymph_nodes,:chest_other,:abdomen_configuration,:umbilicus_abdominal_wall,:size_of_palpable_organs,:masses,:abdomen_other,:hernia,:palpable_lymph_nodes,:inguinal_other,:penis,:penile_length,:scrotum,:bilateral_testes_identified,:testes_size,:testes_position,:labia,:clitoris,:vagina_hymen,:urethral_meatus,:genitalia_other,:spine,:anus,:back_other,:extermities_configuration,:joints,:dermatoglyphics,:extermities_other,:description,:development_habitus, :tubes_specify, :catheters_specify, :needle_marks_specify, :incisions_scars_specify, :rash_excoriation_specify, :petechiae_specify, :ecchymoses_specify, :nevi_angiomas_specify, :configuration_size_specify, :scalp_subcutaneous_specify, :scalp_subgaleal_specify, :calvarium_sutures_specify, :shape_specify, :canals_specify, :size_shape_position_specify, :lids_periorbital_soft_tissue_specify, :conjunctiva_specify, :sclera_cornea_lens_specify, :iris_color_specify, :position_shape_specify, :nares_exudate_specify, :septum_specify, :lips_mucosa_gums_specify, :tongue_specify, :palate_maxilla_mandible_specify, :tonsils_specify, :salivary_glands_specify, :pharynx_specify, :neck_configuration_specify, :Nodes_masses_specify, :axilla_configuration_specify, :axillary_lymph_nodes_specify, :abdomen_configuration_specify, :umbilicus_abdominal_wall_specify, :size_of_palpable_organs_specify, :masses_specify, :hernia_specify, :palpable_lymph_nodes_specify, :penile_length_specify, :scrotum_specify, :bilateral_testes_identified_specify, :testes_size_specify, :labia_specify, :clitoris_specify, :vagina_hymen_specify, :urethral_meatus_specify, :spine_specify, :anus_specify, :extermities_configuration_specify, :joints_specify, :dermatoglyphics_specify, :anterior_fontanelle_measurement, :nodes_masses_specify , :birth_weight,  :weight_at_autopsy,  :crown_heel_length,  :crown_rump_length,  :head_circumference,  :chest_circumference,  :abdomen_circumference,  :foot_length,  :inner_intercanthal_distance,  :interpupillary_distance,  :outer_intercanthal_distance,  :arm_length,  :leg_length, :degree_of_maceration, :patency_of_choanae_specify]))
    authorize! :create, @description.external

    respond_to do |format|
      if @description.external.save
	format.html { redirect_to "#{description_path}#external", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.external }
      else
	format.html { render :new }
	format.json { render json: @description.external.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @description = Description.find(params[:id])

    authorize! :update, @description.external

    respond_to do |format|
      if @description.external.update(params[:external].permit([:nutrition,:hydration_including_edema,:facies,:embalmed,:rigor,:livor,:cyanosis,:icterus,:tubes,:catheters,:needle_marks,:incisions_scars,:rash_excoriation,:petechiae,:ecchymoses,:nevi_angiomas,:configuration_size,:hair_color,:scalp_subcutaneous,:scalp_subgaleal,:calvarium_sutures,:anterior_fontanelle,:head_other,:position,:shape,:canals,:ears_other,:size_shape_position,:lids_periorbital_soft_tissue,:conjunctiva,:sclera_cornea_lens,:iris_color,:pupils,:pupils_specify,:eyes_removed,:eyes_other,:position_shape,:nares_exudate,:patency_of_choanae,:septum,:nose_other,:lips_mucosa_gums,:tongue,:palate_maxilla_mandible,:teeth_upper,:teeth_lower,:tonsils,:salivary_glands,:pharynx,:mouth_other,:neck_configuration,:nodes_masses,:neck_other,:axilla_configuration,:axillary_lymph_nodes,:chest_other,:abdomen_configuration,:umbilicus_abdominal_wall,:size_of_palpable_organs,:masses,:abdomen_other,:hernia,:palpable_lymph_nodes,:inguinal_other,:penis,:penile_length,:scrotum,:bilateral_testes_identified,:testes_size,:testes_position,:labia,:clitoris,:vagina_hymen,:urethral_meatus,:genitalia_other,:spine,:anus,:back_other,:extermities_configuration,:joints,:dermatoglyphics,:extermities_other,:description,:development_habitus, :tubes_specify, :catheters_specify, :needle_marks_specify, :incisions_scars_specify, :rash_excoriation_specify, :petechiae_specify, :ecchymoses_specify, :nevi_angiomas_specify, :configuration_size_specify, :scalp_subcutaneous_specify, :scalp_subgaleal_specify, :calvarium_sutures_specify, :shape_specify, :canals_specify, :size_shape_position_specify, :lids_periorbital_soft_tissue_specify, :conjunctiva_specify, :sclera_cornea_lens_specify, :iris_color_specify, :position_shape_specify, :nares_exudate_specify, :septum_specify, :lips_mucosa_gums_specify, :tongue_specify, :palate_maxilla_mandible_specify, :tonsils_specify, :salivary_glands_specify, :pharynx_specify, :neck_configuration_specify, :Nodes_masses_specify, :axilla_configuration_specify, :axillary_lymph_nodes_specify, :abdomen_configuration_specify, :umbilicus_abdominal_wall_specify, :size_of_palpable_organs_specify, :masses_specify, :hernia_specify, :palpable_lymph_nodes_specify, :penile_length_specify, :scrotum_specify, :bilateral_testes_identified_specify, :testes_size_specify, :labia_specify, :clitoris_specify, :vagina_hymen_specify, :urethral_meatus_specify, :spine_specify, :anus_specify, :extermities_configuration_specify, :joints_specify, :dermatoglyphics_specify, :anterior_fontanelle_measurement, :nodes_masses_specify, :birth_weight,  :weight_at_autopsy,  :crown_heel_length,  :crown_rump_length,  :head_circumference,  :chest_circumference,  :abdomen_circumference,  :foot_length,  :inner_intercanthal_distance,  :interpupillary_distance,  :outer_intercanthal_distance,  :arm_length,  :leg_length , :degree_of_maceration, :patency_of_choanae_specify]))
	format.html { redirect_to "#{description_path}#external", notice: 'Patient was successfully updated.' }
	format.json { render :show, status: :ok, location: @description.external }
      else
	format.html { render :edit }
	format.json { render json: @description.external.errors, status: :unprocessable_entity }
      end
    end
  end

  # This helper returns the standard value of external measurements
end

#
#  private
#    # Use callbacks to share common setup or constraints between actions.
#    def set_patient
#      @description = Description.find(params[:id])
#      #@description.patient = 
#    end
#
#    # Never trust parameters from the scary internet, only allow the white list through.
#    def patient_params
#      params.require(:patient).permit(:name, :dob, :case, :hospital, :age, :date_admission, :race, :sex, :pathologist, :physician, :attendant, :date_autopsy, :time_of_autopsy, :restrictions, :prosector)
#    end
#end
#
