Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :spaces

  namespace :admin do

    get 'login', to: 'sesstions#new'
    post 'login', to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end
end
