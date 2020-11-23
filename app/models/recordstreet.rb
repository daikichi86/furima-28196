class Recordstreet
  
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :record_id
  
  def save
    record = Record.create(number: number, exp_month: exp_month, exp_year: exp_year, cvc: cvc, user_id: user_id, item_id: item_id)
    Street.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, record_id: record.id)
  end

end