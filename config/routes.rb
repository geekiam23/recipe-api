Rails.application.routes.draw do
  get 'recipes/random', to: 'recipes#random'
  resources :recipes
  devise_for :users

  root to: 'recipes#index'
end
