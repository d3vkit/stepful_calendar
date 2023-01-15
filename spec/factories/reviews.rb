FactoryBot.define do
  factory :review do
    appointment { nil }
    note { "MyText" }
    rating { 1 }
  end
end
