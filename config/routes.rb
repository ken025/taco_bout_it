Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations' }
  # omniauth_callbacks: 'users/omniauth_callbacks' 

# Routes for Google authentication
get 'auth/:provider/callback', to: 'sessions#googleAuth'
get 'auth/failure', to: redirect('/')

  root to: "home#index"
end
