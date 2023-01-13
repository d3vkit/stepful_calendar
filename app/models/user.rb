# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :type, presence: true
  validates :type, inclusion: { in: %w[coach student] }
end
