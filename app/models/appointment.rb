# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :availability
  belongs_to :student, foreign_key: :user_id, inverse_of: :appointments

  delegate :start_time, to: :availability
  delegate :end_time, to: :availability

  def self.upcoming
    # binding.pry
    includes(:availability).where(availabilities: { reserved: true, start_time: Time.current.. })
  end
end
