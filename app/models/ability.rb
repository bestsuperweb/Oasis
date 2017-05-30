class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.secretary?
      can :see, :all 
      can [:create, :update],[ Description, Patient ]
      cannot [:create, :update], [External, Internal, FinalDiagnosis, ProvisionalDiagnosis, QuestionAnswer, Placenta, MotherDatum, AncillaryTesting, BlockCode, ClinicoPathologicalSummary, SpecialReport]

    elsif user.physician?
       can [ :see, :update ], Description do |description|
           description.user == user
       end
       can [:create, :see ,:update], [Patient, External, Internal, FinalDiagnosis, ProvisionalDiagnosis, QuestionAnswer, Placenta, MotherDatum, AncillaryTesting, BlockCode, ClinicoPathologicalSummary, SpecialReport] do |given_model|
           given_model.description.user == user
       end
       can [:create, :see,:update], [Patient, External, Internal, FinalDiagnosis, ProvisionalDiagnosis, QuestionAnswer, Placenta, MotherDatum, AncillaryTesting, BlockCode, ClinicoPathologicalSummary, SpecialReport] do |given_model|
	   consultant_array = Array.new()
	   given_model.description.special_reports.each do |sr|
	     consultant_array << sr.assign
	   end
	   consultant_array.include?(user.id.to_s) 
       end
       can [:update_description_through_special_report], Description do |description|
	   consultant_array = Array.new()
	   description.special_reports.each do |sr|
	     consultant_array << sr.assign
	   end
	   consultant_array.include?(user.id.to_s)
       end
    else   
      can :manage, :all
    end
  end
end
