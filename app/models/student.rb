# frozen_string_literal: true

class Student < User
  has_many :appointments, dependent: :destroy, inverse_of: :student
end
