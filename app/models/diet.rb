class Diet < ApplicationRecord
  has_many :diet_recipes
  has_many :recipes, through: :diet_recipes

  def name_for_select
    name.capitalize
  end
end
