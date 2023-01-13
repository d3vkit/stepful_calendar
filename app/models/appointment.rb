# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :calendar
  belongs_to :student, foreign_key: :user_id, inverse_of: :appointments

  validates :start_time, :end_time, presence: true
end
