# frozen_string_literal: true

class Appointment < ApplicationRecord
  has_one :review, dependent: :destroy
  belongs_to :availability
  belongs_to :student, foreign_key: :user_id, inverse_of: :appointments

  delegate :calendar, to: :availability
  delegate :start_time, to: :availability
  delegate :end_time, to: :availability

  def self.upcoming
    includes(:availability).where(availabilities: { start_time: Time.current.. })
  end
end
