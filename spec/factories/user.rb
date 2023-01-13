# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { SecureRandom.uuid }
    name { Faker::Name.name }

    factory :coach, class: Coach, parent: :user do |u|
      type { 'coach' }
    end

    factory :student, class: Student, parent: :user do |u|
      type { 'student' }
    end
  end
end
