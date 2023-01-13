# frozen_string_literal: true

class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[show update]

  def show
    @availabilities = @calendar.scoped_availabilities(current_user).order(start_time: :asc)
  end

  # Only update for nested availabilities
  # def create
  #   @calendar = Calendar.new(calendar_params)

  #   respond_to do |format|
  #     if @calendar.save
  #       format.html { redirect_to calendar_url(@calendar), notice: 'Calendar was successfully created.' }
  #       format.json { render :show, status: :created, location: @calendar }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @calendar.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to calendar_url(@calendar), notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_calendar
    @calendar = Calendar.first
  end

  def calendar_params
    params.fetch(:calendar, {})
  end
end
