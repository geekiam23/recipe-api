class DietRecipe < ApplicationRecord
  belongs_to :diet
  belongs_to :recipe
end
