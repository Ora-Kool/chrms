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

  get 'doctor/dashboard/request_referral', to: 'doctors#request_referral', as: 'doctor/dashboard/request_referral'
  post 'doctor/dashboard/request_referral', to: 'doctors#create_referral'

  get 'doctor/dashboard/request_referral_confirmation/:id', to: 'doctors#referral_confirmation',
  as: 'doctor/dashboard/request_referral_confirmation'

  get 'doctor/:name/dashboard/patients/all', to: 'doctors#patients', as: 'doctors/dashboard/patients/all'
  


  get '/about', to: 'pages#about'
  get '/login-panel', to: 'pages#login'
  get '/contact', to: 'pages#contact'


  root 'pages#home'
  
    



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
