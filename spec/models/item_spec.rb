require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品ができるとき' do
      it '全て入力すれば保存ができる' do
      expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'nameが空では保存できない' do
      @item.name = ' '
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では保存できない' do
      @item.description = ' '
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryを選択していないと保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'Conditionが選択されていないと保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'delivery_burdenが選択されていないと保存できない' do
      @item.delivery_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it 'prefectureが選択されていないと保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'delivery_dayが選択されていないと保存できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'priceが空では保存できない' do
      @item.price = ' '
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字では保存できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end

      it 'priceが半角英数混合では保存できない' do
      @item.price = '300y'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end  

      it 'priceが半角英語では保存できない' do
      @item.price = 'yui'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end  
  
      it 'priceが300円未満では保存できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range.')
      end

      it 'priceが10,000,000円以上では保存できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range.')
      end
    end  
  end
end
