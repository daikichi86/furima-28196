FactoryBot.define do
  factory :item do
    name { "あああ" }
    info { "商品の説明文です" }
    category_id { 2 }
    sales_status_id { 3 }
    shipping_fee_status_id { 2 }
    prefecture_id { 6 }
    scheduled_delivery_id { 3 }
    price{ 3000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
    
  end
end
