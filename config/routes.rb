Rails.application.routes.draw do
  get 'donations/index'
  get 'cards/new'
  devise_for :users
  root to: "teams#index"
  resources :teams do
    collection do
      get 'myteam'
      get 'presearch'
      get 'search'
      get 'donation'
    end
    resources :comments, only: [:create]
    resources :favorites, only: [:create, :destroy]
    resources :applies, only: [:index, :create, :destroy]
    resources :approves, only: [:create, :destroy]
    resources :donations, only: [:new, :create]
  end
  resources :users, only: :show do
    collection do
      get 'favorite'
    end
  end
  resources :cards, only: [:new, :create, :show]
  resources :posts, only: [:index, :create]
end
