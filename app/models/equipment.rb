class Equipment < ApplicationRecord
  belongs_to :step
  has_one_attached :image
end
