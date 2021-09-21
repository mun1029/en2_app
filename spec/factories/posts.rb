FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text  { Faker::Lorem.sentence }
    association :user
    after(:build) do |post|
      parent_category = create(:category)
      child_category = parent_category.children.create(name: Faker::Lorem.sentence)
      grand_child_category = child_category.children.create(name: Faker::Lorem.sentence)
      post.category_id = grand_child_category.id
    end
  end
end
