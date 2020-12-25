class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1 ,message:"Select" }
    validates :sales_status_id, numericality: { other_than: 1 ,message:"Select" }
    validates :shipping_fee_status_id, numericality: { other_than: 1  ,message:"Select"}
    validates :prefecture_id, numericality: { other_than: 1 ,message:"Select"}
    validates :scheduled_delivery_id, numericality: { other_than: 1 ,message:"Select"}
    validates :price, numericality: { only_integer: true,greater_than: 299, less_than: 10000000 ,message:"Out of setting range"}
  end

  validates :price, numericality: { with: /\A[0-9]+\z/ ,message:"Half-width number"} 
 
  belongs_to :user
  has_one :record
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search != ""
      Item.where('info LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
  
end
