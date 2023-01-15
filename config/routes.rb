Rails.application.routes.draw do
  root "calendars#show"

  resources :coaches, only: [:index]

  resources :users, shallow: true do
    resource :schedule, only: [:show]
    resource :calendar do
      resources :availabilities do
        resources :appointments
      end
    end
  end

  get "change_user", to: "users#change"
  get "change_user_to", to: "users#change_to"
end
