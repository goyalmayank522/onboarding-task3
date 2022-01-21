Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
    post '/users/edit' => 'devise/registrations#edit'
  end
  resources :articles
  root "sessions#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
