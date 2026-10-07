Rails.application.routes.draw do
  devise_for :users

  # Landing page pública; resto do app exige login.
  root "pages#home"

  resources :todos, only: [ :index, :create, :update, :destroy ]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
