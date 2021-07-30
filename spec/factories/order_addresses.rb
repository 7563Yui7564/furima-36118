FactoryBot.define do
  factory :order_address do
   postal_code  { '123-4567' }
   prefecture_id  { 2 }
   city { '札幌市' }
   house_number { '1-1' }
   building_name  { 'アレイ' }
   phone_number { '08013546289' }
  end
end
