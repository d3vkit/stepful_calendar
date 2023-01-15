# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { SecureRandom.uuid }
    name { Faker::Name.name }
    type { 'Student' }

    factory :coach, class: 'Coach', parent: :user do
      type { 'Coach' }
    end

    factory :student, class: 'Student', parent: :user do
      type { 'Student' }
    end
  end
end
