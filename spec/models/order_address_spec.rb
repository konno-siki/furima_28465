require 'rails_helper'

RSpec.describe '商品購入機能', type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user, email: 'test@gmail.com')
    sleep 2
    item = FactoryBot.create(:item, user_id: seller.id)
    @order_address = FactoryBot.build(:order_address, user_id: buyer.id, item_id: item.id)
  end

  context '商品が購入できるとき' do
    it '全ての正しい情報を入力すれば商品を購入できる' do
      expect(@order_address).to be_valid
    end
  end

  context '商品が購入できないとき' do
    it 'tokenが空だと購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと購入できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンが無いと購入できない' do
      @order_address.postal_code = '0000000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'prefecture_idが空だと購入できない' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture Select')
    end
    it 'cityが空だと購入できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと購入できない' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telが空だと購入できない' do
      @order_address.tel = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tel can't be blank")
    end
    it 'telがハイフン不要の10桁か11桁の数値でないと購入できない' do
      @order_address.tel = 123_456_789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Tel Enter in 10 or 11 digits without hyphens')
      @order_address.tel = 123 - 456 - 789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Tel Enter in 10 or 11 digits without hyphens')
    end
  end
end
