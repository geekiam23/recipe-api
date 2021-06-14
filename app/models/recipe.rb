# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  title        :string
#  servings     :integer
#  summary      :text
#  instructions :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class Recipe < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
                  against: {
                    title: 'A',
                    summary: 'B'
                  },
                  using: {
                    tsearch: { prefix: true }
                  },
                  associated_against: {
                    cuisines: :name,
                    dish_types: :name,
                    diets: :name,
                    occasions: :name
                  }

  belongs_to :user

  has_one_attached :image

  has_many :cuisine_recipes, dependent: :destroy
  has_many :cuisines, through: :cuisine_recipes

  has_many :dish_type_recipes, dependent: :destroy
  has_many :dish_types, through: :dish_type_recipes

  has_many :diet_recipes, dependent: :destroy
  has_many :diets, through: :diet_recipes

  has_many :occasion_recipes, dependent: :destroy
  has_many :occasions, through: :occasion_recipes

  has_many :favorites, dependent: :destroy

  validate :acceptable_image

  def dairy_free
    diet_included('diary free')
  end

  def gluten_free
    diet_included('gluten free')
  end

  def vegetarian
    diet_included('vegetarian')
  end

  def vegan
    diet_included('vegan')
  end

  def whole_30
    diet_included('whole 30')
  end

  def get_image_url
    url_for(self.image)
  end

  def image_url
    image.service_url if image.attached?
  end

  private

  def diet_included(diet)
    diets.pluck(:name).include? diet
  end

  def acceptable_image
    return unless image.attached?
  
    unless image.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end
end
