# frozen_string_literal: true

Rails.application.routes.draw do
  # TODO: link broken on index spoon view
  # get 'recipes/random', to: 'recipes#random'
  get '/search' => 'recipes#search', :as => 'search_page'
  get 'recipes/random/new', to: 'recipes#random_form', as: 'recipes_random_form'
  post 'recipes/random', to: 'recipes#random'
  resources :recipes do
    resources :favorites, only: %i[create destroy]
  end

  devise_for :users
  root to: 'recipes#index'
end
