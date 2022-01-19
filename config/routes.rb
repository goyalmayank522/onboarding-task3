Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
    post '/users/edit' => 'devise/registrations#edit'
  end
  resources :articles
  root "sessions#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
