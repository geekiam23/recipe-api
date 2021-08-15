# == Schema Information
#
# Table name: ingredients
#
#  id               :bigint           not null, primary key
#  aisle            :string
#  consistency      :string
#  name             :string
#  name_clean       :string
#  original         :string
#  original_string  :string
#  original_clean   :string
#  amount           :integer
#  unit             :string
#  meta             :text             default([]), is an Array
#  meta_information :text             default([]), is an Array
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Ingredient < ApplicationRecord
  has_one_attached :image
end
