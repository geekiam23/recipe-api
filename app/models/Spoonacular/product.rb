# frozen_string_literal: true

module Spoonacular
  class Product < Base
    def base_url
      "#{super}food/products/"
    end

    def info(id)
      endpoint = id.to_s
      params = {}
      get(endpoint, params)
    end

    def find(query, number = 1)
      endpoint = '/search'
      params = { query: query, number: number }
      get(endpoint, params)
    end

    def find_upc(upc)
      endpoint = "/upc/#{upc}"
      params = {}
      get(endpoint, params)
    end

    def similar(upc)
      endpoint = "/upc/#{upc}/comparable"
      params = {}
      get(endpoint, params)
    end
  end
end
