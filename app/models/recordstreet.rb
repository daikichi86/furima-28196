class Recordstreet
  
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :record_id

  with_options presence: true do
    #validates :number
    #validates :exp_month
    #validates :exp_year
    #alidates :cvc
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1 ,message:"Select"}
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
  end
  
  def save
    record = Record.create(number: number, exp_month: exp_month, exp_year: exp_year, cvc: cvc, user_id: user_id, item_id: item_id)
    Street.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, record_id: record.id)
  end

end