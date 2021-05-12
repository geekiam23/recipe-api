# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id]) ||
    @recipe = Spoonacular::Recipe.new.info(params[:recipe_id]).to_dot

    if Favorite.create(favoritable_id: @recipe.id, user: current_user)
      flash[:notice] = "Recipe favorited."
    else
      flash[:alert] = 'Favoriting failed.'
    end

    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(favoritable_id: params[:recipe_id])

    if @favorite.destroy
      flash[:notice] = "Recipe unfavorited."
    else
      flash[:alert] = 'Unfavoriting failed.'
    end
    
    redirect_to @recipe
  end
end
