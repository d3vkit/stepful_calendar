# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :appointment

  validates :rating, numericality: { in: 1..5, only_integer: true }, allow_nil: true
end
