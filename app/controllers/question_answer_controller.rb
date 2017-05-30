class QuestionAnswerController < ApplicationController

  before_action :set_question_answer, only: [:show, :edit, :update, :destroy]

  def new
	  @description = Description.find(params[:id])
	  if @description.question_answer.nil?
	    @question_answer = QuestionAnswer.new
	  else
	    respond_to do |format|
	     format.html { redirect_to "#{description_path}#qa" , notice: 'Ancillary testing record is already present' }
	    end
	  end
	  authorize! :create, @description.question_answer
  end

  def show
      @description = Description.find(params[:id])
  end

  def edit
      @description = Description.find(params[:id])
      @question_answer = @description.question_answer
      authorize! :update, @description.question_answer
  end

  def create
    @description = Description.find(params[:id])
    @description.question_answer = QuestionAnswer.new(question_answer_params)
    authorize! :create, @description.question_answer

    respond_to do |format|
      if @description.question_answer.save 
	format.html { redirect_to "#{description_path}#qa", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.question_answer}
      else
        format.html { render :new }
        format.json { render json: @description.question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    authorize! :update, @description.question_answer

    respond_to do |format|
      if @description.question_answer.update(question_answer_params)
        format.html { redirect_to "#{description_path}#qa", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.question_answer }
      else
        format.html { render :edit }
        format.json { render json: @description.question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_question_answer
      @description = Description.find(params[:id])
      @question_answer = @description.question_answer
    end

    def question_answer_params
      params.require(:question_answer).permit(:major_clinical_diagnosis,:major_pathologic_diagnosis,:clinical_cause_of_death,:pathological_cause_of_death,:discover_a_discrepancy_between_clinical_and_pathologic_diagnosi,:establish_an_unexpected_additional_diagnosis,:confirm_the_major_clinical_diagnosis,:information_relevant_to_genetic_counselling,:information_relevant_to_treatment_effect,:information_on_diagnostic_procedures,:information_relevant_to_previous_lab_or_anatomic_pathology_data,:are_all_parts_of_the_report_complete,:are_the_descriptions_clear,:are_all_gross_abnormalities_confirmed_microscopically,:are_all_appropriate_special_studies_done_and_reported,:diagnoses_justified_on_anatomic_evidence_scroll_down_menu_sayin,:diagnoses_complete,:diagnosis_organized_and_sequenced_by_pathogenetic_significance,:transcriptional_or_typographical_errors,:clinically_relevant_postmortem_findings_addressed_in_cpc,:comments_and_recommendations,:reviewed_by,:date,:description)
    end
end
