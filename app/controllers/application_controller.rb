# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_forgery_protection
  # before_action :authenticate_user!
  
  private

  def require_sign_in
    unless current_user
      flash[:alert] = 'You must be logged in to do that'
      redirect_to new_user_session_path
    end
  end
end
