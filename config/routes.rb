Rails.application.routes.draw do
  #resources :users do
    #resources :articles
  #end
  resources :articles
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root "sessions#welcome"
  get 'welcome', to: 'sessions#welcome'
  get 'users', to: 'users#new'
  post 'users', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
