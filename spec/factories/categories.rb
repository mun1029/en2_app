FactoryBot.define do
  factory :category do
    name     { Faker::Lorem.sentence }
    ancestry { nil }
  end
end
