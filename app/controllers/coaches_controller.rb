# frozen_string_literal: true

class CoachesController < ApplicationController
  def index
    @coaches = Coach.includes(:calendar)
  end
end
