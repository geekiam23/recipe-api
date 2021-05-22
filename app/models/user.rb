# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :favorites, dependent: :destroy

  def favorite_for(recipe)
    favorites.find_by(favoritable_id: recipe.id)
  end

  def create_favorite_for(spoonacular_id)
    recipe = Recipe.get_recipe_by_spoonacular_id(self.id, spoonacular_id)
    self.favorites.create(favoritable_type: 'Recipe', favoritable_id: recipe.id)
    recipe
  end
end
