Rails.application.routes.draw do
  # TODO: why did i have to move it up
  # TODO: link broken on index spoon view
  # get 'recipes/random', to: 'recipes#random'
  get 'recipes/random/new', to: 'recipes#random_form', as: 'recipes_random_form'
  post 'recipes/random', to: 'recipes#random'
  resources :recipes do
    resources :favorites, only: [:create, :destroy]
  end
  
  devise_for :users
  root to: 'recipes#index'
end
