Rails.application.routes.draw do
  root "calendars#show"

  resources :users, shallow: true do
    resource :schedule, only: [:show]
    resource :calendar
  end

  get "change_user", to: "users#change"
  get "change_user_to", to: "users#change_to"
end
