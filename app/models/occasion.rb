# frozen_string_literal: true

# == Schema Information
#
# Table name: occasions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Occasion < ApplicationRecord
  has_many :occasion_recipes
  has_many :recipes, through: :occasion_recipes
  has_many :favorites, as: :favoritable, dependent: :destroy

  def name_for_select
    name&.capitalize
  end
end
