FactoryBot.define do
  factory :item do
    name                { 'タブレット' }
    description         { '綺麗' }
    category_id         { 2 }
    condition_id        { 3 }
    delivery_burden_id  { 4 }
    prefecture_id       { 5 }
    delivery_day_id     { 2 }
    price               { 300 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
