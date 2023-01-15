# frozen_string_literal: true

FactoryBot.define do
  factory :availability do
    calendar

    reserved { false }
    start_time { 1.minute.from_now }
    end_time { start_time + 2.hours }
  end
end
