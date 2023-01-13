# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    calendar { nil }
    user { nil }
    start_time { '2023-01-12 22:37:00' }
    end_time { '2023-01-12 22:37:00' }
  end
end
