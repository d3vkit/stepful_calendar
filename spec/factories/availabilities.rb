# frozen_string_literal: true

FactoryBot.define do
  factory :availability do
    calendar

    start_time { 1.minute.from_now }
    end_time { start_time + 2.hours }

    trait :reserved do
      after(:build) do |availability, _evaluator|
        FactoryBot.build(:appointment, availability:) if availability.appointment.nil?
      end

      after(:create) do |availability, _evaluator|
        FactoryBot.create(:appointment, availability:) if availability.appointment.nil?
      end
    end
  end
end
