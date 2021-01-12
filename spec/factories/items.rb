FactoryBot.define do
  factory :item do
    item_name     {Faker::Team.name}
    about         {Faker::Lorem.sentence}
    category_id   {2}
    condition_id  {2}
    shipping_id   {2}
    prefecture_id {2}
    day_id        {2}
    price         {9999}
    association   :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
