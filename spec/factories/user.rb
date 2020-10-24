FactoryBot.define do
  factory :user do
    nickname { 'タロー'}
    email { 'sample@sample.com'}
    password { 'test1111'}
    password_confirmation { password}
    last_name { '鈴木'}
    first_name { '太郎'}
    last_name_kana { 'スズキ'}
    first_name_kana { 'タロウ'}
    birth_date {'1940-01-01'}
  end
end