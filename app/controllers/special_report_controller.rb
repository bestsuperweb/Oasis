class SpecialReportController < ApplicationController

  before_action :set_description
  
  #GET 
  def index
    @special_reports = @description.special_reports.all
  end

  # 
  def new
    @special_report = @description.special_reports.build
    authorize! :create, @special_report 
  end

  def create
    @special_report = @description.special_reports.build(special_report_params)
    authorize! :create, @special_report
    respond_to do |format|
      if @special_report.save
        format.html{ redirect_to "#{description_path}#special", notice: "A special report was successfully created!" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @special_report = @description.special_reports.find(params[:report_id])
    #authorize! :update, @special_report rescue authorize! :update_if_assigned, @special_report
    authorize! :update, SpecialReport 
    unless @special_report.lock.nil?
      email     = params[:sign_out][:email]
      password  = params[:sign_out][:password]
      user = User.find_by_email(email)
      respond_to do |format|
        if !user.nil? and user.valid_password?(password) and user == User.find(@special_report.assign)
          format.html { render :edit, notice: "Assigned user was successfully logged in!" }
        else
          format.html{ redirect_to "#{description_path}#special", notice: "The email and/or password entered is/are incorrect." }
        end
      end
    end

  end

  def show
    @special_report = @description.special_reports.find(params[:report_id])
    authorize! :see , @special_report rescue authorize! :see_if_assigned, @special_report
  end

  def update
    #authorize! :update, @special_report  rescue authorize! :update_if_assigned, @special_report
    authorize! :update, SpecialReport 
    @special_report = @description.special_reports.find(params[:report_id])
    respond_to do |format|
      if @special_report.update(special_report_params)
        format.html{ redirect_to "#{description_path}#special", notice: "A special report was successfully updated!" }
      else
        format.html { render :edit }
      end
    end
  end

  def delete
    @special_report = @description.special_reports.find(params[:report_id])
    respond_to do |format|
      if @special_report.destroy
        format.html{ redirect_to "#{description_path}#special", notice: "A special report was successfully deleted!" }
      else
        format.html { render :edit }
      end
    end
  end

  def sign_out
    @special_report = @description.special_reports.find(params[:report_id])
    email     = params[:sign_out][:email]
    password  = params[:sign_out][:password]
    user = User.find_by_email(email)
    if !user.nil? and user.valid_password?(password) and user == User.find(@special_report.assign)
      if @special_report.update(:lock => email)
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

  def special_report_params
    params.require("special_report").permit(:title, :final_diagnosis, :gross_description, :blockcode, :microscopic_description, :assign, :lock)
  end

  def signout_params
    params.require("sign_out").permit(:email, :password)
  end

end
