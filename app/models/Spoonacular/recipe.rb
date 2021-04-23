module Spoonacular
  class Recipe < Base
    def base_url
      super + "/recipes/"
    end

    def find(params)
      endpoint = "/complexSearch"
      params = { }
      get(endpoint, params)
    end
    
    def find_ingredient(params)
      endpoint = '/findByIngredients'
      params = { }
      get(endpoint, params)
    end

    def find_nutrient(params)
      endpoint = '/findByIngredients'
      params = { }
      get(endpoint, params)
    end

    def info(id)
      endpoint = id.to_s + '/information'
      params = { :includeNutrition => false }
      get(endpoint, params)
    end

    def extract(url)
      endpoint = '/extract'
      params = { :url => url.to_s }
      get(endpoint, params)
    end

    def random
      endpoint = "random"
      params = {}
      get(endpoint, params)["recipes"].first
    end
    
    def similar(id)
      endpoint = id.to_s + '/similar'
      params = { :number => 2 }
      recipes = get(endpoint, params)
      recipeIds = recipes.map{|recipe| recipe['id']}
      recipes(recipeIds.join(','))
    end
    
    def info_bulk(ids)
      endpoint = '/informationBulk'
      params = { :ids => ids.to_s }
      get(endpoint, params)
    end
  end
end