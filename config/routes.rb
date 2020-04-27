Rails.application.routes.draw do

  resources :friendships
  resources :groups do
    member do
       delete 'remove/:friend_id', :action => 'remove',:as => 'remove'
       post 'add_friend', :action => 'add_friend'
      end
  end
  get '/orders/:id/view/' ,to: 'orders#show' ,as:"view"
  get '/orders/:id/finish/', to: 'orders#finish',as: "finish"
  get '/orders/:id/cancel/', to: 'orders#cancel',as: "cancel"

  resources :orders

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root 'profile#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
