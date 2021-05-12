# frozen_string_literal: true

class OccasionRecipe < ApplicationRecord
  belongs_to :occasion
  belongs_to :recipe
end
