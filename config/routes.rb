Rails.application.routes.draw do
  # get "sign_up", to: "organizations#new", as: :new_user_registration
  get "sign_up", to: "organizations#new", as: :new_user_registration
  devise_for :users, skip: [:registration, :session]
  as :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    post "sign_in", to: "devise/sessions#create", as: :user_session
    delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
    get "users/edit", to: "devise/registrations#edit", as: :edit_user_registration
    put "users", to: "devise/registrations#update", as: :user_registration
  end
  
  root "pages#home"

  # Customer Account
  namespace :account do
    get "dashboard", to: "dashboard#index", as: :dashboard
    resources :notes
    resources :documents
  end

  # Public
  resources :organizations, only: [:new, :create]

end
