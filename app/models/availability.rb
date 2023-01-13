# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :calendar

  validates :start_time, :end_time, presence: true
  validates :reserved, inclusion: { in: [true, false] }
end
