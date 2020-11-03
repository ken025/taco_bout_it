Rails.application.routes.draw do
  resources :restaurants
  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}


root to: "users#show"
end
