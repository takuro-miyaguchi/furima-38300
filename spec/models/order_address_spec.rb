require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @orders = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '購入できるとき' do
      it 'post_code、prefecture_id、municipality、address、building、phone_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '購入できないとき' do
      # 郵便番号が必須であること。
      it 'post_codeが空では購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end

      # 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと。
      it 'post_codeが桁違いでは保存できない' do
        @order.post_code = '1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
      it 'post_codeがハイフン無しでは保存できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
      it 'post_codeが全角では保存できない' do
        @order.post_code = '１２３-３４５６'
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end

      # 都道府県が必須であること。
      it 'prefecture_idが空では購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end

      # 市区町村が必須であること。
      it 'municipalityが空では購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end

      # 番地が必須であること。
      it 'addressが空では購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end

      # 電話番号が必須であること。
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end

      # 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと。
      it 'phone_numberが9桁以下では保存できない' do
        @order.phone_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
      it 'phone_numberが全角では保存できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include("")
      end
    end
  end
end