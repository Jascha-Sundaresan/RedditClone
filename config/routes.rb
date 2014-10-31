Rails.application.routes.draw do
  resources :users do
    resources :subs, only: [:new]
  end 
  resource :session
  resources :subs, except: [:new]
  root 'static_pages#index'
end
