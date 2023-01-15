# frozen_string_literal: true

class Availability < ApplicationRecord
  has_one :appointment, dependent: :destroy
  belongs_to :calendar

  validates :start_time, :end_time, presence: true
  validates :reserved, inclusion: { in: [true, false] }

  def self.upcoming_appointments
    includes(:appointment).where(reserved: true, start_time: Time.current..)
  end
end
