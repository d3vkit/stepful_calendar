# frozen_string_literal: true

class SchedulesController < ApplicationController
  def show
    @appointments = appointments.order('availabilities.start_time asc').upcoming
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def appointments
    current_user.appointments.includes(:availability)
  end
end
