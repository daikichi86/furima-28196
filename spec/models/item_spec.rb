require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    
    it "全ての条件を満たしていれば商品はは出品できる" do
      expect(@item).to be_valid
    end

    it "imageが無いと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "infoが空だと登録できない" do
      @item.info = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "category_idを選択しないと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    
    it "sales_status_idが空だと登録できない" do
      @item.sales_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end

    it "sales_status_idを選択しないと登録できない" do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end
    
    it "shipping_fee_status_idが空だと登録できない" do
      @item.shipping_fee_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status Select")
    end

    it "shipping_fee_status_idを選択しないと登録できない" do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status Select")
    end
    
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "prefecture_idを選択しないと登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end
    
    it "scheduled_delivery_idが空だと登録できない" do
      @item.scheduled_delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end

    it "scheduled_delivery_idを選択しないと登録できない" do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end

    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが¥300より小さいと登録できない" do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが¥9,999,999より大きいと登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが半角数字でないと登録できない" do
      @item.price = "９９９９"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    
  end
end
