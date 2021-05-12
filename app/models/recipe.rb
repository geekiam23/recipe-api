class Recipe < ApplicationRecord
  belongs_to :user

  has_many :cuisine_recipes, dependent: :destroy
  has_many :cuisines, through: :cuisine_recipes
  
  has_many :dish_type_recipes, dependent: :destroy
  has_many :dish_types, through: :dish_type_recipes
  
  has_many :diet_recipes, dependent: :destroy
  has_many :diets, through: :diet_recipes
  
  has_many :occasion_recipes, dependent: :destroy
  has_many :occasions, through: :occasion_recipes
  
  has_many :favorites, as: :favoritable, dependent: :destroy
  
  def dairy_free
    diet_included('diary free')
  end
   
  def gluten_free
    diet_included('gluten free')
  end
  
  def vegetarian
    diet_included('vegetarian')
  end

  def vegan
    diet_included('vegan')
  end

  def whole_30
    diet_included('whole 30')
  end

  private
  def diet_included(diet)
    diets.pluck(:name).include? diet
  end
end
