class Order

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

end