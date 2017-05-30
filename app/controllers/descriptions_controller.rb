class DescriptionsController < ApplicationController
  before_action :set_description, only: [:show, :edit, :update, :destroy]

  def index
    #@descriptions = current_user.description 
    #Description.all.each  do |temp|
    #end
    #if current_user.admin?
      @descriptions = Description.all
    #end
  end

  def new
    @description = Description.new
  end

  #def call_new_patient
  #  redirect_to new_patient_path
  #end

  def edit
          @description = Description.find(params[:id])
	  if ! @description.patient.nil?
		@patient = @description.patient
	  end
	  authorize! :update_description_through_special_report, @description rescue authorize! :update, @description 
  end

  def show
          @description = Description.find(params[:id])
          authorize! :update_description_through_special_report, @description rescue authorize! :update, @description 
	  if ! @description.patient.nil?
		  @patient = @description.patient
	  end
  end

  def create
    @description = Description.new(description_params)
    respond_to do |format|
      if current_user.description << @description
        format.html { redirect_to @description, notice: 'Description was successfully created.' }
        format.json { render :show, status: :created, location: @description }
      else
        format.html { render :new }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update_description_through_special_report, @description rescue authorize! :update, @description 
    respond_to do |format|
      if @description.update(description_params)
        format.html { redirect_to @description, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description }
      else
        format.html { render :edit }
        format.json { render json: @description.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description
      @description = Description.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def description_params
      params.require(:description).permit(:user_id, :description, :case_identifier)
    end

end
