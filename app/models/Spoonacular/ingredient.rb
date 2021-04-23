module Spoonacular
  class Ingredient < Base
    def base_url
      super + "food/ingredients/"
    end

    def info(id, amount = 1)
      endpoint = id.to_s + "/information"
      params = {}
      get(endpoint, params)
    end

    def amount(id, nutrient, unit = 'oz', target = 5)
      endpoint = id.to_s + "/amount"
      params = { :nutrient =>  nutrient, :target => target.to_s, :unit => unit}
      get(endpoint, params)
    end
    
    def parse(ingredientList, servings = 1, includeNutrition = true)
      endpoint = "/parseIngredients"
      params = { :ingredientList =>  ingredientList, :servings => servings, :includeNutrition => includeNutrition}
      get(endpoint, params)
    end

    def sub(ingredientName)
      endpoint = "/substitutes"
      params = { :ingredientName =>  ingredientName}
      get(endpoint, params)
    end
  end
end 