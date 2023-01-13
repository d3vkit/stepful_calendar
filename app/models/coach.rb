# frozen_string_literal: true

class Coach < User
  has_one :calendar, dependent: :destroy, inverse_of: :coach, foreign_key: :user_id
  has_many :appointments, through: :calendar
end
