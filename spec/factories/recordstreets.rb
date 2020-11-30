FactoryBot.define do
  factory :recordstreet do

    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '444-0000' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    building { 'ビル' }
    phone_number { "09011111111" }
    price { 10000 }
  end
end
