class BodyMeasurementsController < ApplicationController
	def show
		@description = Patient.find(params[:id])
	end

	def new
		@description = Patient.find(params[:id])
		if @description.body_measurement.nil?
		  @body_measurement = BodyMeasurement.new 
		else
		  respond_to do |format|
		   format.html { redirect_to body_measurement_path, notice: 'Patient Body Measurement is Already Generated.' }
		  end
	        end
	end

	def create
		@description = Patient.find(params[:id])
            respond_to do |format|
	       if @description.body_measurement = BodyMeasurement.new(params.require(:body_measurement).permit(:crown_heel, :crown_rump, :head_circumference, :chest_circumference, :abdomen_circumference, :weight, :birth_weight, :intercanthal_distance, :interpupillary_distance, :arms, :leg, :foot_length, :description_id))
		format.html { redirect_to description_path, notice: 'Patient Body Weight is created successfully.' }
		format.json { render :show, status: :ok, location: @description.body_measurement }
	       else
	        format.html { render :edit }
	        format.json { render json: @description.body_measurement.errors, status: :unprocessable_entity }
	       end
	  end
	end

	def edit
		@description = Patient.find(params[:id])
		@body_measurement = @description.body_measurement
	end

	def update
	    @description = Patient.find(params[:id])
            respond_to do |format|
	    if @description.body_measurement.update(params.require(:body_measurement).permit(:crown_heel, :crown_rump, :head_circumference, :chest_circumference, :abdomen_circumference, :weight, :birth_weight, :intercanthal_distance, :interpupillary_distance, :arms, :leg, :foot_length, :description_id))
		format.html { redirect_to description_path, notice: 'Patients body measurement was successfully updated.' }
		format.json { render :show, status: :ok, location: @description.body_measurement }
	    else
	        format.html { render :edit }
	        format.json { render json: @description.body_measurement.errors, status: :unprocessable_entity }
            end
	   end
	end
end
