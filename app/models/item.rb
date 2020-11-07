class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 ,message:"Select" }
    validates :sales_status_id, numericality: { other_than: 1 ,message:"Select" }
    validates :shipping_fee_status_id, numericality: { other_than: 1  ,message:"Select"}
    validates :prefecture_id, numericality: { other_than: 1 ,message:"Select"}
    validates :scheduled_delivery_id, numericality: { other_than: 1 ,message:"Select"}
    validates :price, numericality: { only_integer: true,greater_than: 300, less_than: 9999999 ,message:"Out of setting range"}
  end

  validates :price, numericality: { with: /\A[0-9]+\z/ ,message:"Half-width number"} 
 
  belongs_to :user
  
end
