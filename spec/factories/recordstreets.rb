FactoryBot.define do
  factory :recordstreet do
    number { '111111111' }
    exp_month { 22 }
    exp_year { 24 }
    cvc { 444 }
    postal_code { '444-0000' }
    prefecture_id { 2 }
    city { '東京都' }
    addresses { '1-1' }
    building { 'ビル' }
    phone_number { "09011111111" }
  end
end
