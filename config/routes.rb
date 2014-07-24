Rails.application.routes.draw do
  root 'static#root'
  
  resources :users
  resource :session
end
