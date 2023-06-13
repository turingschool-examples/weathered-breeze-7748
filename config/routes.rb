Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :scientists, only: [:show]

  resources :labs, only: [:show]

  resources :scientists do
    resources :experiments, only: [:destroy], controller: 'scientist_experiments'
  end

  resources :experiments, only: [:index]
end
