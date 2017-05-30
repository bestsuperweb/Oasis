class AncillaryTestingsController < ApplicationController
  before_action :set_ancillary_testing, only: [:show, :edit, :update, :destroy]

  def new
	  @description = Description.find(params[:id])
	  if @description.ancillary_testing.nil?
	    @ancillary_testing = AncillaryTesting.new
	  else
	    respond_to do |format|
	     format.html { redirect_to "#{description_path}#tests", notice: 'Ancillary testing record is already present' }
	    end
	  end
	  authorize! :create, @description.ancillary_testing
  end

  def show
  end

  def edit
      @description = Description.find(params[:id])
      @ancillary_testing = @description.ancillary_testing
      authorize! :update, @description.ancillary_testing
  end

  def create
    @description = Description.find(params[:id])
    @description.ancillary_testing = AncillaryTesting.new(ancillary_testing_params)
    authorize! :create, @description.ancillary_testing

    respond_to do |format|
      if @description.ancillary_testing.save 
	format.html { redirect_to "#{description_path}#tests", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.ancillary_testing}
      else
        format.html { render :new }
        format.json { render json: @description.ancillary_testing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update	  
    authorize! :update, @description.ancillary_testing
    respond_to do |format|
      if @description.ancillary_testing.update(ancillary_testing_params)
        format.html { redirect_to "#{description_path}#tests", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.ancillary_testing }
      else
        format.html { render :edit }
        format.json { render json: @description.ancillary_testing.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_ancillary_testing
      @description = Description.find(params[:id])
      @ancillary_testing = @description.ancillary_testing
    end

    def ancillary_testing_params
      params.require(:ancillary_testing).permit(:microbiology,:viral_culture,:karyotype_requested,:electron_microscopy,:molecular_diagnostic_pathology,:specimens_snap_frozen,:post_mortem_x_rays,:photographs,:organs_for_special_study,:other,:description,:microbiology_specify,:viral_culture_specify,:karyotype_requested_specify,:electron_microscopy_specify)
    end
end
