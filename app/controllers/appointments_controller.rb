# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_availability, only: [:create]

  def create
    @appointment = @availability.create_appointment(student: current_user)

    redirect_to user_schedule_url(current_user)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    redirect_to user_schedule_url(current_user), status: :no_content, notice: 'Appointment was successfully destroy.'
  end

  private

  def set_availability
    @availability = Availability.find(params[:availability_id])
  end
end
