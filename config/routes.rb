Rails.application.routes.draw do
 

  get '/manager/dashboard/doctor/add', to: 'manager#new_doctor'
  post '/manager/dashboard/doctor/add', to: 'manager#create_doctor'

  get '/manager/dashboard/staff/add', to: 'manager#new_staff'
  post '/manager/dashboard/staff/add', to: 'manager#create_staff'

  get 'managers/session/login', to: 'manager_sessions#new'
  post 'managers/session/login', to: 'manager_sessions#create'
  delete 'managers/session/logout', to: 'manager_sessions#destroy'

  get 'login-panel/doctors/login', to: 'login_sessions#new'
  post 'login-panel/doctors/login', to:  'login_sessions#create'
  delete 'doctor/logout', to:  'login_sessions#destroy'

  get 'manager/dashboard', to: 'manager#show'
  get 'doctor/dashboard', to: 'doctors#show'
  get "doctor/:name/edit#{'#profile-settings'}", to: 'doctors#edit', as: 'doctor/dashboard/edit'
  patch "doctor/:name/edit#{'#profile-settings'}", to: 'doctors#update'

  get 'doctor/:name/incomplete-profile', to: 'doctors#incomplete', as: 'doctor/dashboard/incomplete'
  patch 'doctor/:name/incomplete_update', to: 'doctors#incomplete_update', as: 'doctor/incomplete_update'

  get 'doctor/dashboard/request_referral/hospitals/doctors/:id', to: 'doctors#request_referral',
   as: 'doctor/dashboard/request_referral/hospitals/doctors'
  
  post 'doctor/dashboard/request_referral/hospitals/doctors/:id', to: 'doctors#create_referral'
  
  get 'doctor/dashboard/request_referral/hospitals', to: 'doctors#hospitals',
   as: 'doctor/dashboard/request_referral/hospitals'

  get 'doctor/dashboard/request_referral_confirmation/:id', to: 'doctors#referral_confirmation',
  as: 'doctor/dashboard/request_referral_confirmation'

  get 'doctor/:name/dashboard/patients/all', to: 'doctors#patients', as: 'doctors/dashboard/patients/all'

  get 'doctor/dashboard/read_referrals/patient/:id', to: 'doctors#read_referral',
  as: 'doctor/dashboard/read_referrals/patient_referral_details'

  get 'doctor/dashboard/read_referral/patient/:id/referral_back_slip', to: 'doctors#referral_back_slip',
  as: 'doctor/dashboard/read_referral/patient/referral_back_slip'
  post 'doctor/dashboard/read_referral/patient/:id/referral_back_slip', to: 'doctors#submit_referral_back_slip'

  get 'doctor/dashboard/submitted_referral_back_slips/patient/:id', to: 'doctors#submitted_back_slips',
  as: 'doctor/dashboard/submitted_back_slips/patient'

  get 'doctor/dashboard/total_referrals_made', to: "doctors#total_referrals_made", 
  as: 'doctor/dashboard/total_referrals_made'

  post '/contact', to: "pages#send_message"


  


  get '/about', to: 'pages#about'
  get '/login-panel', to: 'pages#login'
  get '/contact', to: 'pages#contact'


  root 'pages#home'
  
 
#account activation resources
 resources :account_activations, only: [:edit]
 #get 'doctor/password_resets/:id/edit', to: "password_resets#edit", as: "doctor/password_resets/edit"
 resources :password_resets, only: [:new, :edit, :create, :update]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
