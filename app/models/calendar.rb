# frozen_string_literal: true

class Calendar < ApplicationRecord
  has_many :availabilities, dependent: :destroy
  has_many :appointments, through: :availabilities
  belongs_to :coach, foreign_key: :user_id, inverse_of: :calendar

  def scoped_availabilities(user)
    return availabilities.includes(:appointment) if user.coach?

    availabilities.includes(:appointment).where(appointments: { availability_id: nil })
  end
end
