FactoryBot.define do
  factory :order_address do
    post_code      {"123-4567"}
    sender_id      {Faker::Number.between(from: 2, to: 48)}
    municipality   {Faker::Address.city}
    address        {Faker::Address.street_address}
    building       {"柳ビル103"}
    phone_number   {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}"}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end