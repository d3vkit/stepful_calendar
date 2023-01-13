Rails.application.routes.draw do
  resources :calendar
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "calendar#show"
end
