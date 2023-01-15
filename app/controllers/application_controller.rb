# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_user_type

  helper_method :current_user

  def current_user
    # CHANGE TO LOGIN SYSTEM
    @coach ||= Coach.first
    @student ||= Student.first

    @current_user = cookies[:user_type] == 'Coach' ? @coach : @student
  end

  private

  def set_user_type
    return if cookies[:user_type]

    cookies[:user_type] = 'Student'
  end
end
