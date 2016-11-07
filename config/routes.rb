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

  get '/manager/dashboard', to: 'manager#show'
  get '/chrms/doctors/dashboard', to: 'doctors#show'

  get '/about', to: 'pages#about'
  get '/login-panel', to: 'pages#login'
  get '/contact', to: 'pages#contact'


  root 'pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
