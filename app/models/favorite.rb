# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :favoritable, polymorphic: true, optional: true
  belongs_to :user
end
