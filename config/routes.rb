Rails.application.routes.draw do

  resources :appointments
  resources :patients

  namespace :admin do
    resources :employees
    get '/doctors', to: 'employees#doctors'
    resources :insurances
    resources :prescriptions
    post '/login', to: 'authentication#login'
    get '/getemployee', to: 'authentication#getemployee'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
