class ClinicoPathologicalSummaryController < ApplicationController
  before_action :set_clinico_pathological_summary, only: [:show, :edit, :update, :destroy]

  def new
	  @description = Description.find(params[:id])
	  if @description.clinico_pathological_summary.nil?
	    @clinico_pathological_summary = ClinicoPathologicalSummary.new
	  else
	    respond_to do |format|
	     format.html { redirect_to "#{description_path}#clinpath", notice: 'Ancillary testing record is already present' }
	    end
	  end
	  authorize! :create, @description.clinico_pathological_summary
  end

  def show
  end

  def edit
      @description = Description.find(params[:id])
      @clinico_pathological_summary = @description.clinico_pathological_summary
      authorize! :update, @description.clinico_pathological_summary
  end

  def create
    @description = Description.find(params[:id])
    @description.clinico_pathological_summary = ClinicoPathologicalSummary.new(clinico_pathological_summary_params)
    authorize! :create, @description.clinico_pathological_summary

    respond_to do |format|
      if @description.clinico_pathological_summary.save 
	format.html { redirect_to "#{description_path}#clinpath", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.clinico_pathological_summary}
      else
        format.html { render :new }
        format.json { render json: @description.clinico_pathological_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @description.clinico_pathological_summary
    respond_to do |format|
      if @description.clinico_pathological_summary.update(clinico_pathological_summary_params)
        format.html { redirect_to "#{description_path}#clinpath", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.clinico_pathological_summary }
      else
        format.html { render :edit }
        format.json { render json: @description.clinico_pathological_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_clinico_pathological_summary
      @description = Description.find(params[:id])
      @clinico_pathological_summary = @description.clinico_pathological_summary
    end

    def clinico_pathological_summary_params
      params.require(:clinico_pathological_summary).permit(:clinpath_summary, :description, :references)
    end
end

