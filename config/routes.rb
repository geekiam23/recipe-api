Rails.application.routes.draw do
  # TODO: link broken on index spoon view
  # get 'recipes/random/', to: 'recipes#random'
  post 'recipes/random', to: 'recipes#random'
  get 'recipes/random/new', to: 'recipes#random_form', as: 'recipes_random_form'
  get 'recipes/random/:id', to: 'recipes#random_show', as: 'recipes_random_show'
  get 'recipes/favorites/new', to: 'favorites#new', as: 'recipes_favorites_new'
  post 'recipes/favorites/:recipe_id', to: 'favorites#create', as: 'recipes_favorites'
  delete 'recipes/favorites/:recipe_id', to: 'favorites#destroy', as: 'recipes_favorite'

  # resources :favorites, only: [:create, :destroy]
  resources :recipes 
  
  devise_for :users
  root to: 'recipes#index'
end
