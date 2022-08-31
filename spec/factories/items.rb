FactoryBot.define do
  factory :item do
    title        {Faker::Name.name}
    concept      {Faker::Lorem.sentence}
    category_id  {2}
    condition_id {2}
    charge_id    {2}
    sender_id    {2}
    period_id    {2}
    price        {"98765"}

    association :user
    # purchase_record

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
