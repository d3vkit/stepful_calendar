# frozen_string_literal: true

class Student < User
  has_many :appointments, dependent: :destroy, foreign_key: :user_id, inverse_of: :student
end
