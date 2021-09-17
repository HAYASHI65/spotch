Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams do
    collection do
      get 'presearch'
      get 'search'
      get 'teamapply'
    end
    resources :comments, only: [:create]
    resources :favorites, only: [:create, :destroy]
    resources :applies, only: [:create, :destroy]
  end
  resources :users, only: :show do
    collection do
      get 'myfavorite'
    end
  end
end
