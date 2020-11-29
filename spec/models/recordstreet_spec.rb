require 'rails_helper'

RSpec.describe Recordstreet, type: :model do
  describe '購入記録の保存' do
    before  do
      @recordstreet = FactoryBot.build(:recordstreet)
    end
    
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@recordstreet).to be_valid
    end
    
    it 'トークンが空だと登録できないこと' do
      @recordstreet.token = nil
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと登録できないこと' do
      @recordstreet.postal_code = nil
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号がハイフン有り(7桁)でないと登録できないこと' do
      @recordstreet.postal_code = "4440000"
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Postal code Input correctly")
    end

    it '都道府県が空だと登録できないこと' do
      @recordstreet.prefecture_id = nil
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県が選択されてないと登録できないこと' do
      @recordstreet.prefecture_id = 1
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Prefecture Select")
    end

    it '市区町村が空だと登録できないこと' do
      @recordstreet.city = nil
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと登録できないこと' do
      @recordstreet.addresses = nil
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Addresses can't be blank")
    end
    
    it '電話番号が空だと登録できないこと' do
      @recordstreet.phone_number = nil
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が10桁または11桁でないと登録できないこと' do
      @recordstreet.phone_number = "1111"
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Phone number Input only number")
    end

    it '金額が空だと登録できないこと' do
      @recordstreet.price = nil
      binding.pry
      @recordstreet.valid?
      expect(@recordstreet.errors.full_messages).to include("Price can't be blank")
    end

  end
end
