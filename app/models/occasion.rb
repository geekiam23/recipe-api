# frozen_string_literal: true

class Occasion < ApplicationRecord
  has_many :occasion_recipes
  has_many :recipes, through: :occasion_recipes
  has_many :favorites, as: :favoritable, dependent: :destroy

  def name_for_select
    name&.capitalize
  end
end
