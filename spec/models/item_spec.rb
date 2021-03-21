require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it "全カラムが正しく入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it "画像が添付されていないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it "商品名が空では出品できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it "商品説明文が空では出品できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Text can't be blank")
      end
      it "category_idが1の時、出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it "status_idが1の時、出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status must be other than 1")
      end
      it "delivery_cost_idが1の時、出品できない" do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery cost must be other than 1")
      end
      it "address_idが1の時、出品できない" do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Address must be other than 1")
      end
      it "shipping_day_idが1の時、出品できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping day must be other than 1")
      end
      it "販売価格が空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it "販売価格が300円より安い場合、出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999,999円より高い場合、出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it "販売価格が全角で入力されている場合、出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
    end
  end
end

