Rails.application.routes.draw do
  root to: 'static#root'
  get '/splash', to: 'static#splash'
  
  resources :users, only: [:show, :create, :destroy, :update]
  resource :session, only: [:create, :destroy]
  
  namespace :api, defaults: { format: :json } do
    resources :boards, except: [:new, :edit]
    resources :lists, only: [:create, :update, :destroy]
    resources :cards, only: [:create, :update, :destroy]
    resources :items, only: [:create, :update, :destroy]
    resources :board_memberships, only: [:create, :destroy]
    resources :card_assignments, only: [:create, :destroy]
  end
end