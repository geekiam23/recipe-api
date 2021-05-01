# frozen_string_literal: true

module Spoonacular
  class Recipe < Base
    def base_url
      "#{super}/recipes/"
    end

    def find(params = )
      endpoint = '/complexSearch'
      get(endpoint, params)
    end

    def find_ingredient(params = {})
      endpoint = '/findByIngredients'
      get(endpoint, params)
    end

    def find_nutrient(params = {})
      endpoint = '/findByIngredients'
      get(endpoint, params)
    end

    def info(id)
      endpoint = "#{id}/information"
      params = { includeNutrition: false }
      get(endpoint, params)
    end

    def extract(url)
      endpoint = '/extract'
      params = { url: url.to_s }
      get(endpoint, params)
    end

    def random(params)
      endpoint = 'random'
      params = { tags: params['tags'].reject(&:empty?), number: params['number'] }
      get(endpoint, params)['recipes']
    end

    def similar(id)
      endpoint = "#{id}/similar"
      params = { number: 2 }
      recipes = get(endpoint, params)
      recipe_ids = recipes.map { |recipe| recipe['id'] }
      recipes(recipe_ids.join(','))
    end

    def info_bulk(ids)
      endpoint = '/informationBulk'
      params = { ids: ids.to_s }
      get(endpoint, params)
    end
  end
end
