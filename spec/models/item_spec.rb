require 'rails_helper'

RSpec.describe '商品出品機能', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品できるとき' do
    it '全ての情報が正しく入力されれば出品できる' do
      expect(@item).to be_valid
    end
    it 'priceが300以上であれば出品できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
    it 'priceが9999999以下であれば出品できる' do
      @item.price = 9_999_999
      expect(@item).to be_valid
    end
    it 'priceが半角数字で入力されていれば出品できる' do
      @item.price = 3000
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空だと出品できない' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'textが空だと出品できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'category_idが空だと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it 'status_idが空だと出品できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end
    it 'fee_idが空だと出品できない' do
      @item.fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee Select')
    end
    it 'prefecture_idが空だと出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it 'delivery_idが空だと出品できない' do
      @item.delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery Select')
    end
    it 'priceが空だと出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300未満だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが10000000以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが半角数字で入力されていないと出品できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it 'ユーザーが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
