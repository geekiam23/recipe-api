# frozen_string_literal: true

# == Schema Information
#
# Table name: cuisines
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cuisine < ApplicationRecord
  has_many :cuisine_recipes
  has_many :recipes, through: :cuisine_recipes
  has_many :favorites, as: :favoritable, dependent: :destroy

  def name_for_select
    name.capitalize
  end
end
