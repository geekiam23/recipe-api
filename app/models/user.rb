# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :favorites, dependent: :destroy

  def favorite_for(recipe)
    favorites.find_by(recipe_id: recipe.id)
  end
end
