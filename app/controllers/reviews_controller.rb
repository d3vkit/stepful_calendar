# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_appointment

  def new
    @review = @appointment.build_review
  end

  def edit
    @review = @appointment.review
  end

  def create
    @review = @appointment.build_review(review_params)

    create_and_respond(@review)
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def review_params
    params.require(:review).permit(:note)
  end

  def calendar
    @appointment.calendar
  end

  def user
    calendar.coach
  end

  def create_and_respond(review)
    respond_to do |format|
      if review.save
        format.html { redirect_to user_calendar_url(user), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: review.errors, status: :unprocessable_entity }
      end
    end
  end
end
