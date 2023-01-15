# frozen_string_literal: true

class AvailabilitiesController < ApplicationController
  def index; end

  def show; end

  def new
    @availability = calendar.availabilities.new
  end

  def edit
    @availability = Availability.find(params[:id])
  end

  def create
    @availability = calendar.availabilities.new(create_params)

    create_and_respond(@availability)
  end

  def update; end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy

    redirect_to root_path, status: :no_content, notice: 'Availability was successfully created.'
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def calendar
    @calendar ||= user.calendar
  end

  def create_params
    params.require(:availability).permit(:start_time, :end_time)
  end

  def create_and_respond(availability)
    respond_to do |format|
      if availability.save
        format.html { redirect_to user_calendar_url(user), notice: 'Availability was successfully created.' }
        format.json { render :show, status: :created, location: calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: availability.errors, status: :unprocessable_entity }
      end
    end
  end
end
