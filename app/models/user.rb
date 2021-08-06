# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  has_many :recipes
  has_many :favorites, dependent: :destroy

  has_secure_token
  before_save      { self.email = email.downcase }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
              presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 254 }


  def generate_jwt
    JWT.encode({token: token, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  def favorite_for(recipe)
    favorites.find_by(favoritable_id: recipe.id)
  end

  def create_favorite_for(spoonacular_id)
    recipe = Recipe.get_recipe_by_spoonacular_id(self.id, spoonacular_id)
    self.favorites.create(favoritable_type: 'Recipe', favoritable_id: recipe.id)
    recipe
  end
end
