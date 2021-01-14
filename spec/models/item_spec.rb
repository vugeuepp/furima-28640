require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば出品できること' do
          expect(@item).to be_valid
        end

        it '価格の範囲が、¥300~¥9,999,999の間であれば出品できること' do
          @item.price = '1234567'
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it '画像なしでは出品できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
    
        it '商品名が空では出品できないこと' do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
    
        it '商品説明が空では出品できないこと' do
          @item.about = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("About can't be blank")
        end
    
        it 'カテゴリーが「---」では出品できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category Select')
        end
    
        it '商品の状態が「---」では出品できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition Select')
        end
    
        it '配送料の負担が「---」では出品できないこと' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping Select')
        end
    
        it '発送元の地域が「---」では出品できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture Select')
        end
    
        it '発送までの日数が「---」では出品できないこと' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Day Select')
        end
    
        it '販売価格が空では出品できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
    
        it '販売価格が¥299以下では出品できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
    
        it '販売価格が¥10,000,000以上では出品できないこと' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
    
        it '販売価格は半角数字のみ保存可能であること' do
          @item.price = '３７７６'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
        end

        it '半角英数混合では出品できないこと' do
          @item.price = '300yen'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it '半角英語だけでは出品できないこと' do
          @item.price = 'zeroyen'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
        end
      end
    end
      end
    end

    


