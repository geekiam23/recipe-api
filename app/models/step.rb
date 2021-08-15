# == Schema Information
#
# Table name: steps
#
#  id            :bigint           not null, primary key
#  description   :string
#  number        :integer
#  ingredient_id :bigint           not null
#  equipment_id  :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Step < ApplicationRecord
  has_many :ingredients
  has_many :equipments
end
