# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.build(recipe: recipe)

    if favorite.save
      flash[:notice] = 'Recipe favorited.'
    else
      flash[:alert] = 'Favoriting failed.'
    end

    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(id: params[:id])

    if favorite&.destroy
      flash[:notice] = 'Recipe unfavorited.'
    else
      flash[:alert] = 'Unfavoriting failed.'
    end
    redirect_to recipe
  end
end
