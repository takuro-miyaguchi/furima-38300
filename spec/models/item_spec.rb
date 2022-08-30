require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'imageとtitle、concept、category、condition、charge、sender、period、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      # 商品画像を1枚つけることが必須であること。
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名が必須であること。
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      # 商品の説明が必須であること。
      it 'conceptが空では出品できない' do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end

      # カテゴリーの情報が必須であること。
      it 'categoryが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      # 商品の状態の情報が必須であること。
      it 'conditionが空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      # 配送料の負担が必須であること。
      it 'chargeが空では出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      # 配送元の地域の情報が必須であること。
      it 'senderが空では出品できない' do
        @item.sender_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end

      # 発送までの日数の情報が必須であること。
      it 'periodが空では出品できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end

      # 価格の情報が必須であること。
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      # 価格が¥300~¥9,999,999の間のみ保存可能であること。
      it 'priceが¥300より低額では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが¥9,999,999より高額では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      # 価格は半角数値のみ保存可能であること。
      it 'priceが全角数値では出品できない' do
        @item.price = '９８７６５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
