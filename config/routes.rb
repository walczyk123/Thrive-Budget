Rails.application.routes.draw do
  root to: "pages#home"

  resources :users, controller: :users
  resources :registrations
  resources :passwords
  resources :sign_in
end
