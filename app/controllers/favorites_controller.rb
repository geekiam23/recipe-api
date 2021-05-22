# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    @recipe = current_user.create_favorite_for(params[:recipe_id])
    flash[:notice] = "Recipe favorited."

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
