# frozen_string_literal: true

class Coach < User
  has_many :calendars, dependent: :destroy, inverse_of: :coach
end
