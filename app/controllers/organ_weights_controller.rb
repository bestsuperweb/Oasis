class OrganWeightsController < ApplicationController
	def show
		@patient = Patient.find(params[:id])
	end
	def new
		@patient = Patient.find(params[:id])
		if @patient.organ_weight.nil?
		  @organ_weight = OrganWeight.new 
		else
		  respond_to do |format|
		   format.html { redirect_to organ_weight_path, notice: 'Patient Organ Weight is Already Generated.' }
		  end
	        end
	end
	def create
		@patient = Patient.find(params[:id])
            respond_to do |format|
		if @patient.organ_weight = OrganWeight.new(params[:organ_weight].permit([:brain_expected, :brain_observed, :heart_expected, :heart_observed, :liver_expected, :liver_observed, :lt_adrenal_expected, :lt_adrenal_observed, :lt_kidney_expected, :lt_kidney_observed, :lt_lung_expected, :lt_lung_observed, :rt_adrenal_expected, :rt_adrenal_observed, :rt_kidney_expected, :rt_kidney_observed, :rt_lung_expected, :rt_lung_observed, :spleen_expected, :spleen_observed, :thymus_expected, :thymus_observed]))
		 format.html { redirect_to patient_path, notice: 'Patients Organ weight is  successfully created.' }
		 format.json { render :show, status: :ok, location: @patient.organ_weight }
		else
	         format.html { render :edit }
	         format.json { render json: @patient.organ_weight.errors, status: :unprocessable_entity }
		end
	    end
	end
	def edit
		@patient = Patient.find(params[:id])
		@organ_weight = @patient.organ_weight
	end
	def update
	    @patient = Patient.find(params[:id])
            respond_to do |format|
	    if @patient.organ_weight.update(params[:organ_weight].permit([:brain_expected, :brain_observed, :heart_expected, :heart_observed, :liver_expected, :liver_observed, :lt_adrenal_expected, :lt_adrenal_observed, :lt_kidney_expected, :lt_kidney_observed, :lt_lung_expected, :lt_lung_observed, :rt_adrenal_expected, :rt_adrenal_observed, :rt_kidney_expected, :rt_kidney_observed, :rt_lung_expected, :rt_lung_observed, :spleen_expected, :spleen_observed, :thymus_expected, :thymus_observed]))
		format.html { redirect_to patient_path, notice: 'Patient was successfully updated.' }
		format.json { render :show, status: :ok, location: @patient.organ_weight }
	    else
	        format.html { render :edit }
	        format.json { render json: @patient.organ_weight.errors, status: :unprocessable_entity }
            end
	   end
	end
end
