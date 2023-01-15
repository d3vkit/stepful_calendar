# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :type, presence: true
  validates :type, inclusion: { in: %w[Coach Student] }

  def coach?
    is_a?(Coach)
  end

  def student?
    is_a?(Student)
  end
end
