require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '商品購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_info = FactoryBot.build(:order_info, item_id: item.id, user_id: user.id)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_info).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_info.building_name = nil
        expect(@order_info).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_info.postal_code = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Postal code can't be blank", "Postal code Input correctly")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_info.postal_code = '1234567'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_info.prefecture_id = 1
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Prefecture Select")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_info.prefecture_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Select")
      end
      it 'cityが空だと保存できないこと' do
        @order_info.city = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_info.house_number = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("House number can't be blank")
      end
      it 'tel_numberが空だと保存できないこと' do
        @order_info.tel_number = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberは半角数字のみ保存可能であること' do
        @order_info.tel_number = '０９０１１０９１１０９'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Tel number Half-width number")
      end
      it 'tel_numberが12桁以上では保存できないこと' do
        @order_info.tel_number = '090110911099'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Tel number too long")
      end
      it 'tokenが空では登録できないこと' do
        @order_info.token = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @order_info.item_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では保存できないこと' do
        @order_info.user_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end