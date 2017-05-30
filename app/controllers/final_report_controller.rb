class FinalReportController < ApplicationController

  before_action :set_description
  
  def new
    @final_report = @description.final_report.build
    authorize! :create, @final_report 
  end

  def create
    @description.final_report = FinalReport.new(final_report_params)
    @final_report = @description.final_report
    authorize! :create, @final_report
    respond_to do |format|
      if @final_report.save
        format.html{ redirect_to "#{description_path}#placenta", notice: "A final report was successfully created!" }
      else
        format.html { redirect_to "#{description_path}#placenta", notice: "There was an error to create final report!"  }
      end
    end
  end

  def edit
    @final_report = @description.final_report
    #authorize! :update, @final_report rescue authorize! :update_if_assigned, @final_report
    authorize! :update, @final_report 
    unless @final_report.lock.nil?
      email     = params[:sign_out][:email]
      password  = params[:sign_out][:password]
      user = User.find_by_email(email)
      respond_to do |format|
        if !user.nil? and user.valid_password?(password) and user == User.find(@final_report.assign)
          format.html { render :edit, notice: "Assigned user was successfully logged in!" }
        else
          format.html{ redirect_to "#{description_path}#final", notice: "The email and/or password entered is/are incorrect." }
        end
      end
    end

  end

  def show
    @final_report = @description.final_report
    authorize! :see , @final_report rescue authorize! :see_if_assigned, @final_report
  end

  def update
    #authorize! :update, @final_report  rescue authorize! :update_if_assigned, @final_report
    authorize! :update, @final_report 
    @final_report = @description.final_report
    respond_to do |format|
      if @final_report.update(final_report_params)
        format.html{ redirect_to "#{description_path}#placenta", notice: "A final report was successfully updated!" }
      else
        format.html { redirect_to "#{description_path}#placenta", notice: "There was an error to save final report!" }
      end
    end
  end

  def delete
    @final_report = @description.final_report
    respond_to do |format|
      if @final_report.destroy
        format.html{ redirect_to "#{description_path}#placenta", notice: "A final report was successfully deleted!" }
      else
        format.html { render :edit }
      end
    end
  end

  def sign_out
    @final_report = @description.final_report
    email     = params[:sign_out][:email]
    password  = params[:sign_out][:password]
    user = User.find_by_email(email)
    if !user.nil? and user.valid_password?(password) and user == User.find(@final_report.assign)
      if @final_report.update(:lock => email)
        @result = 'success' 
      else
        @result = 'failure'
      end
    else
      @result = 'failure'
    end      
    # respond_to do |f|      
    #   f.js { render layout: false, content_type: 'text/javascript' }
    #   f.html
    # end           
  end

  def set_description
    @description = Description.find(params[:id])

  end

  def final_report_params
    params.require("final_report").permit( :assign, :lock, :report, :flag )
  end

  def signout_params
    params.require("sign_out").permit(:email, :password)
  end

end
