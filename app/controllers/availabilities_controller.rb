# frozen_string_literal: true

class AvailabilitiesController < ApplicationController
  def index; end

  def show; end

  def new
    @availability = calendar.availabilities.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def calendar
    @calendar ||= user.calendar
  end
end
