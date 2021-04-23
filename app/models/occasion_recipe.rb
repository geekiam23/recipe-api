class OccasionRecipe < ApplicationRecord
  belongs_to :occasion
  belongs_to :recipe
end
