Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: "teams#index"
  resources :teams do
    collection do
      get 'presearch'
      get 'search'
      get 'apply'
    end
    resources :comments, only: [:create]
    resources :favorites, only: [:create, :destroy]
    resources :applies, only: [:create, :destroy]
    resources :donation, only: [:index, :create]
  end
  resources :users, only: :show do
    collection do
      get 'favorite'
    end
  end
  resources :cards, only: [:new, :create, :show]
end
