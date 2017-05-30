Rails.application.routes.draw do
  devise_for :users
  #resources :selectors
  get 'selector' => 'selector#index', as: :selector
  root 'selector#index'
  resources :descriptions

  #patient is as a function of description
  get   'descriptions/:id/patient'      => 'patients#show'   , as: :patient
  get   'descriptions/:id/patients'     => 'patients#show'   , as: :patients
  get   'descriptions/:id/patients/new' => 'patients#new'    , as: :new_patient
  #post  'descriptions/:id/patient'      => 'patients#create'
  post  'descriptions/:id/patient'      => 'patients#create'
  get   'descriptions/:id/patient/edit' => 'patients#edit'   , as: :edit_patient
  patch 'descriptions/:id/patient'      => 'patients#update'

  #mother_datum is as a function of description
  get   'descriptions/:id/mother_datum'      => 'mother_data#show'   , as: :mother_datum
  get   'descriptions/:id/mother_data'       => 'mother_data#show'   , as: :mother_data
  get   'descriptions/:id/mother_data/new'   => 'mother_data#new'    , as: :new_mother_datum
  post  'descriptions/:id/mother_datum'      => 'mother_data#create'
  get   'descriptions/:id/mother_datum/edit' => 'mother_data#edit'   , as: :edit_mother_datum
  patch 'descriptions/:id/mother_datum'      => 'mother_data#update'

  get   'descriptions/:id/external'      => 'external#show'   , as: :external
  get   'descriptions/:id/externals'     => 'external#show'   , as: :externals
  get   'descriptions/:id/externals/new' => 'external#new'    , as: :new_external
  post  'descriptions/:id/external'      => 'external#create'
  get   'descriptions/:id/external/edit' => 'external#edit'   , as: :edit_external
  patch 'descriptions/:id/external'      => 'external#update'

  get   'descriptions/:id/internal'      => 'internal#show'   , as: :internal
  get   'descriptions/:id/internals'     => 'internal#show'   , as: :internals
  get   'descriptions/:id/internals/new' => 'internal#new'    , as: :new_internal
  post  'descriptions/:id/internal'      => 'internal#create'
  get   'descriptions/:id/internal/edit' => 'internal#edit'   , as: :edit_internal
  patch 'descriptions/:id/internal'      => 'internal#update'

  # New paths for four sections of internals
  get   'descriptions/:id/internalhn'      => 'internalhn#show'    , as: :internalhn
  get   'descriptions/:id/internalhn/edit' => 'internalhn#edit'    , as: :edit_internalhn
  post  'descriptions/:id/internalhn'      => 'internalhn#create'
  patch 'descriptions/:id/internalhn'      => 'internalhn#update'
  # New paths for four sections of internals
  get   'descriptions/:id/internalnt'      => 'internalnt#show'    , as: :internalnt
  get   'descriptions/:id/internalnt/edit' => 'internalnt#edit'    , as: :edit_internalnt
  post  'descriptions/:id/internalnt'      => 'internalnt#create'
  patch 'descriptions/:id/internalnt'      => 'internalnt#update'
  # New paths for four sections of internals
  get   'descriptions/:id/internalap'      => 'internalap#show'    , as: :internalap
  get   'descriptions/:id/internalap/edit' => 'internalap#edit'    , as: :edit_internalap
  post  'descriptions/:id/internalap'      => 'internalap#create'
  patch 'descriptions/:id/internalap'      => 'internalap#update'

  get   'descriptions/:id/ancillary_testing'      => 'ancillary_testings#show'   , as: :ancillary_testing
  get   'descriptions/:id/ancillary_testings'     => 'ancillary_testings#show'   , as: :ancillary_testings
  get   'descriptions/:id/ancillary_testings/new' => 'ancillary_testings#new'    , as: :new_ancillary_testing
  post  'descriptions/:id/ancillary_testing'      => 'ancillary_testings#create'
  get   'descriptions/:id/ancillary_testing/edit' => 'ancillary_testings#edit'   , as: :edit_ancillary_testing
  patch 'descriptions/:id/ancillary_testing'      => 'ancillary_testings#update'

  get   'descriptions/:id/clinico_pathological_summary'       => 'clinico_pathological_summary#show'   , as: :clinico_pathological_summary
  get   'descriptions/:id/clinico_pathological_summaries'     => 'clinico_pathological_summary#show'   , as: :clinico_pathological_summaries
  get   'descriptions/:id/clinico_pathological_summaries/new' => 'clinico_pathological_summary#new'    , as: :new_clinico_pathological_summary
  post  'descriptions/:id/clinico_pathological_summary'       => 'clinico_pathological_summary#create'
  get   'descriptions/:id/clinico_pathological_summary/edit'  => 'clinico_pathological_summary#edit'   , as: :edit_clinico_pathological_summary
  patch 'descriptions/:id/clinico_pathological_summary'       => 'clinico_pathological_summary#update'

  get   'descriptions/:id/question_answer'       => 'question_answer#show'   , as: :question_answer
  get   'descriptions/:id/question_answers'      => 'question_answer#show'   , as: :question_answers
  get   'descriptions/:id/question_answers/new'  => 'question_answer#new'    , as: :new_question_answer
  post  'descriptions/:id/question_answer'       => 'question_answer#create'
  get   'descriptions/:id/question_answer/edit'  => 'question_answer#edit'   , as: :edit_question_answer
  patch 'descriptions/:id/question_answer'       => 'question_answer#update'

  get   'descriptions/:id/placenta'       => 'placenta#show'   , as: :placenta
  get   'descriptions/:id/placentas'      => 'placenta#show'   , as: :placentas
  get   'descriptions/:id/placentas/new'  => 'placenta#new'    , as: :new_placenta
  post  'descriptions/:id/placenta'       => 'placenta#create'
  get   'descriptions/:id/placenta/edit'  => 'placenta#edit'   , as: :edit_placenta
  patch 'descriptions/:id/placenta'       => 'placenta#update'

  get   'descriptions/:id/block_codes'         => 'block_codes#show', as: :block_codes
  get   'descriptions/:id/block_codes/new'     => 'block_codes#new', as: :new_block_code
  post  'descriptions/:id/block_codes'         => 'block_codes#create'

  get   'descriptions/:id/provisional_diagnosis'       => 'provisional_diagnosis#show'   , as: :provisional_diagnosis
  get   'descriptions/:id/provisional_diagnoses'       => 'provisional_diagnosis#show'   , as: :provisional_diagnoses
  get   'descriptions/:id/provisional_diagnoses/new'   => 'provisional_diagnosis#new'    , as: :new_provisional_diagnosis
  post  'descriptions/:id/provisional_diagnosis'       => 'provisional_diagnosis#create'
  get   'descriptions/:id/provisional_diagnosis/edit'  => 'provisional_diagnosis#edit'   , as: :edit_provisional_diagnosis
  patch 'descriptions/:id/provisional_diagnosis'       => 'provisional_diagnosis#update'

  get   'descriptions/:id/final_diagnosis'       => 'final_diagnosis#show'   , as: :final_diagnosis
  get   'descriptions/:id/final_diagnoses'       => 'final_diagnosis#show'   , as: :final_diagnoses
  get   'descriptions/:id/final_diagnoses/new'   => 'final_diagnosis#new'    , as: :new_final_diagnosis
  post  'descriptions/:id/final_diagnosis'       => 'final_diagnosis#create'
  get   'descriptions/:id/final_diagnosis/edit'  => 'final_diagnosis#edit'   , as: :edit_final_diagnosis
  patch 'descriptions/:id/final_diagnosis'       => 'final_diagnosis#update'


  get  'descriptions/:id/specialreport/'                     => 'special_report#index' , as: :special_report
  get  'descriptions/:id/specialreport/new'                  => 'special_report#new', as: :new_special_report
  post 'descriptions/:id/specialreport/create'              => 'special_report#create', as: :create_special_report
  get  'descriptions/:id/specialreport/:report_id/edit'      => 'special_report#edit', as: :edit_special_report
  post 'descriptions/:id/specialreport/:report_id/update'   => 'special_report#update', as: :update_special_report
  get  'descriptions/:id/specialreport/:report_id/delete'    => 'special_report#delete', as: :delete_special_report
  post 'descriptions/:id/specialreport/:report_id/signout'  => 'special_report#sign_out', as: :signout_special_report
  get  'descriptions/:id/specialreport/:report_id/show'      => 'special_report#show', as: :show_special_report

  get   'descriptions/:id/final_report'       => 'final_report#show'   , as: :show_final_report
  get   'descriptions/:id/final_report/new'   => 'final_report#new'    , as: :new_final_report
  post  'descriptions/:id/final_report'       => 'final_report#create' , as: :create_final_report
  get   'descriptions/:id/final_report/edit'  => 'final_report#edit'   , as: :edit_final_report
  patch 'descriptions/:id/final_report'       => 'final_report#update' , as: :update_final_report
  post  'descriptions/:id/final_report/signout'  => 'final_report#sign_out', as: :signout_final_report

  # For full report
  get  'descriptions/:id/fullreport/show'      => 'full_report#show', as: :show_full_report
end
