# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_user_type

  helper_method :current_user

  def current_user
    # binding.pry
    # CHANGE TO LOGIN SYSTEM
    cookies[:user_type] == 'Coach' ? Coach.first : Student.first
  end

  private

  def set_user_type
    return if cookies[:user_type]

    cookies[:user_type] = 'Student'
  end
end
