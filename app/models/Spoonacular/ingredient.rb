# frozen_string_literal: true

module Spoonacular
  class Ingredient < Base
    def base_url
      "#{super}food/ingredients/"
    end

    def info(id, _amount = 1)
      endpoint = "#{id}/information"
      params = {}
      get(endpoint, params)
    end

    def amount(id, nutrient, unit = 'oz', target = 5)
      endpoint = "#{id}/amount"
      params = { nutrient: nutrient, target: target.to_s, unit: unit }
      get(endpoint, params)
    end

    def parse(ingredient_list, servings = 1, include_nutrition = true)
      endpoint = '/parseIngredients'
      params = { ingredientList: ingredient_list, servings: servings, includeNutrition: include_nutrition }
      get(endpoint, params)
    end

    def sub(ingredient_name)
      endpoint = '/substitutes'
      params = { ingredientName: ingredient_name }
      get(endpoint, params)
    end
  end
end
