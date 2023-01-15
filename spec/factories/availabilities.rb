# frozen_string_literal: true

FactoryBot.define do
  factory :availability do
    calendar

    start_time { 1.minute.from_now }
    end_time { start_time + 2.hours }

    trait :reserved do
      after(:build) do |availability, _evaluator|
        if availability.appointment.nil?
          FactoryBot.build(:appointment, availability:)
        end
      end

      after(:create) do |availability, _evaluator|
        if availability.appointment.nil?
          FactoryBot.create(:appointment, availability:)
        end
      end
    end
  end
end
