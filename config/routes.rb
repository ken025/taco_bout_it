Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}

  resources :restaurants do 
    resources :reviews
  end 

   resources :reviews

root to: "application#home"
end
