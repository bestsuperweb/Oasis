class FullReportController < ApplicationController
 before_action :set_description, only: [:show]
 def show 
 end
 private
 def set_description
       @description = Description.find(params[:id])
 end
end
