# == Schema Information
#
# Table name: equipment
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Equipment < ApplicationRecord
  belongs_to :step
  has_one_attached :image
end
