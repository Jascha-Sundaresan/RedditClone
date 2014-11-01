Rails.application.routes.draw do
  resources :users do
    resources :subs, only: [:new, :create]
  end 
  
  resource :session
  resources :subs, except: [:new, :create] do
    resources :posts, only: [:new, :create]
  end
  
  resources :posts, except: [:new, :create]
  root 'static_pages#index'
end
