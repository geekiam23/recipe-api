# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def perm_url
    host = Rails.env.production? ? ENV["TEST"] : "http://localhost:3000"
    Rails.application.routes.url_helpers.rails_blob_url(image.blob, host: host)
  end
end
