# frozen_string_literal: true

class Diet < ApplicationRecord
  has_many :diet_recipes
  has_many :recipes, through: :diet_recipes
  has_many :favorites, as: :favoritable, dependent: :destroy

  def name_for_select
    name.capitalize
  end
end
