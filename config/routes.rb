Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/scientists/:id", to: "scientists#show"
  delete "/scientists/:scientist_id/scientist_experiments/:id", to: "scientist_experiments#destroy"
  get "/experiments", to: "experiments#index"
end
