Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    resources :comments, only: [:create]
    resources :favorites, only: [:create, :destroy]
  end
end
