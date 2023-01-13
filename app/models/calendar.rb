# frozen_string_literal: true

class Calendar < ApplicationRecord
  has_many :availabilities, dependent: :destroy
  has_many :appointments, dependent: :destroy
  belongs_to :coach, foreign_key: :user_id, inverse_of: :calendars
end
