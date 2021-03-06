Rails.application.routes.draw do
  root to: 'static#root'
  get '/splash', to: 'static#splash'
  get '/why', to: 'static#why'
  get '/community', to: 'static#community'
  get '/help', to: 'static#help'
  
  resources :users, only: [:show, :create, :destroy, :update] do
    collection do
      get 'activate'
      get 'demo'
    end
  end
  
  resource :session, only: [:create, :destroy]
  
  namespace :api, defaults: { format: :json } do
    resources :boards, except: [:new, :edit] do
      collection do
        get 'subscribe'
      end
    end
    resources :lists, only: [:create, :update, :destroy]
    resources :cards, only: [:create, :update, :destroy]
    resources :items, only: [:create, :update, :destroy]
    resources :board_memberships, only: [:create, :destroy]
    resources :card_assignments, only: [:create, :destroy]
  end
end