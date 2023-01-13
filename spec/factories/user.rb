# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    initialize_with { type.present? ? type.constantize.new : new }

    id { SecureRandom.uuid }
    name { Faker::Name.name }

    trait :coach do
      type { 'coach' }
    end

    trait :student do
      type { 'student' }
    end
  end
end
