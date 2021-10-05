Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: "teams#index"
  get 'donations/index'
  get 'cards/new'
  resources :teams do
    collection do
      get 'myteam'
      get 'search'
      get 'donation'
    end
    #resources :comments, only: [:create]
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
  resources :chats, only: [:index, :show, :create]
end
