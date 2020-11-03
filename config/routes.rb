Rails.application.routes.draw do
  resources :restaurants
  devise_for :users, :controllers => {registrations: 'registrations' }
  # omniauth_callbacks: 'users/omniauth_callbacks' 

# Routes for Google authentication
get 'auth/:provider/callback', to: 'sessions#omniauth'
get 'auth/failure', to: redirect('/')

root to: "users#show"
end
