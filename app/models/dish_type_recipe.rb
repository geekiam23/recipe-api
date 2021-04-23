class DishTypeRecipe < ApplicationRecord
  belongs_to :dish_type
  belongs_to :recipe
end
