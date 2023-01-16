# frozen_string_literal: true

class CalendarsController < ApplicationController
  def show
    @availabilities = calendar.scoped_availabilities(current_user).order(start_time: :asc)
  end

  private

  def user
    @user ||= params[:user_id] ? User.find(params[:user_id]) : Coach.first
  end

  def calendar
    @calendar ||= user.calendar
  end
end
