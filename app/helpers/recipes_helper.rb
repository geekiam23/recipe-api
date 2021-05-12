module RecipesHelper
  def capitalize_join_text(data)
    if data && data.name
      data.map{ |c| c.name.capitalize }.join(', ')
    end
  end
end
