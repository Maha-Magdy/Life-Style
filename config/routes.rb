Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"

  root 'categories#index'
  
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :categories
  resources :votes
end
