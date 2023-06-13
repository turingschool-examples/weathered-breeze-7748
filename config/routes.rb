Rails.application.routes.draw do
  resources :scientist_experiments, only: [:destroy], controller: "scientist_experiments"
  resources :scientists, only: [:show]
  resources :experiments, only: [:index]
end
