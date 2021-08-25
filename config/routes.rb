# frozen_string_literal: true

Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get '/search' => 'recipes#search', :as => 'search_page'

  # TODO: Refactor favorites
  # get 'recipes/random/', to: 'recipes#random'
  post 'recipes/random', to: 'recipes#random'
  get 'recipes/random/new', to: 'recipes#random_form', as: 'recipes_random_form'
  get 'spoonacular/recipes/:id', to: 'recipes#random_show', as: 'recipes_random_show'

  get 'recipes/favorites/new', to: 'favorites#new', as: 'recipes_favorites_new'
  post 'recipes/favorites/:recipe_id', to: 'favorites#create', as: 'recipes_favorites'
  delete 'recipes/favorites/:recipe_id', to: 'favorites#destroy', as: 'recipes_favorite'
  # resources :favorites, only: [:create, :destroy]
  resources :recipes
  post 'recipes/random', to: 'recipes#random'
  get '/member-data', to: 'members#show'

  devise_for :users,
              controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }
  root to: 'recipes#index'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
end