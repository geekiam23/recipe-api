# frozen_string_literal: true

class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  has_many :recipes
  has_many :favorites, dependent: :destroy

  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  def favorite_for(recipe)
    favorites.find_by(recipe_id: recipe.id)
  end
end
