# frozen_string_literal: true

# == Schema Information
#
# Table name: diets
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Diet < ApplicationRecord
  has_many :diet_recipes
  has_many :recipes, through: :diet_recipes

  def name_for_select
    name.capitalize
  end
end
