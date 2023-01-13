# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { SecureRandom.uuid }
    name { Faker::Name.name }
    type { 'student' }

    factory :coach, class: 'Coach', parent: :user do
      type { 'coach' }
    end

    factory :student, class: 'Student', parent: :user do
      type { 'student' }
    end
  end
end
