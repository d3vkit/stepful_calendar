# frozen_string_literal: true

FactoryBot.define do
  factory :availability do
    calendar

    reserved { false }
    start_time { '2023-01-12 22:34:33' }
    end_time { '2023-01-12 22:34:33' }
  end
end
