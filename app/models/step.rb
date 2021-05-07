class Step < ApplicationRecord
  has_many :ingredients
  has_many :equipments
end
