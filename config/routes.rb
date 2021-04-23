Rails.application.routes.draw do
  get 'recipes/random', to: 'recipes#random'
  resources :recipes do
    resources :favorites, only: [:create, :destroy]
  end
  
  devise_for :users
  root to: 'recipes#index'
end
