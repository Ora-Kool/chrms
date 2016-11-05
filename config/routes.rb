Rails.application.routes.draw do
  get 'managers/session/login', to: 'manager_sessions#new'
  post 'managers/session/login', to: 'manager_sessions#create'
  delete 'managers/session/logout', to: 'manager_sessions#destroy'

  get 'doctors/show'

  get '/login', to: 'login_sessions#new'
  post '/login', to:  'login_sessions#create'

  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  root 'pages#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
