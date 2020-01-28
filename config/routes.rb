Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'
  get "dashboard", to: "games#dashboard"
  get "reservation_dashboard", to: "reservations#reservation_dashboard"
  resources :games do
    resources :reservations, only: [ :new, :create ]
  end
  resources :reservations, only: [ :index, :show, :reservation_dashboard, :edit, :update ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
