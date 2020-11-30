class Recordstreet
  
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :price, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :record_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1 ,message:"Select"}
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
    validates :price
  end
  
  def save
    record = Record.create(user_id: user_id, item_id: item_id, price: price)
    Street.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, record_id: record.id)
  end

end