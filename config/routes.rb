Rails.application.routes.draw do
  get '/orders/:id/finish/', to: 'orders#finish',as: "finish"
  get '/orders/:id/cancel/', to: 'orders#cancel',as: "cancel"

  resources :orders
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'profile#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
