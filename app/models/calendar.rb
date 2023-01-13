# frozen_string_literal: true

class Calendar < ApplicationRecord
  has_many :availabilities, dependent: :destroy
  has_many :appointments, through: :availabilities
  belongs_to :coach, foreign_key: :user_id, inverse_of: :calendar

  def scoped_availabilities(user)
    user.is_a?(Coach) ? availabilities : availabilities.where(reserved: false)
  end
end
