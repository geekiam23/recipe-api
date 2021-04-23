module Spoonacular
  class MenuItems < Base
    def base_url
      super + "food/menuItems/"
    end

    def info(id)
      endpoint = id.to_s
      params = {}
      get(endpoint, params)
    end

    def find(query, number = 10)
      endpoint = "/search"
      params = {:query => query, :number => number}
      get(endpoint, params)
    end
  end
end