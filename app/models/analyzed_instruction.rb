# == Schema Information
#
# Table name: analyzed_instructions
#
#  id         :bigint           not null, primary key
#  step_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AnalyzedInstruction < ApplicationRecord
  has_many :steps
end
