require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      @order = FactoryBot.build(:order)
    end

    context '保存がうまくいく時' do
      it "全項目が正しく入力されていれば保存ができる" do
        expect(@order).to be_valid
      end
      it "building_nameが空でも保存できる" do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '保存がうまくいかない時' do
      it "tokenが空では保存できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では保存できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンが含まれていないと保存できない" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      #it "postal_codeが数字でないと保存できない" do
        #@order.postal_code = "あいう-えおかき"
        #@order.valid?
        #expect(@order.errors.full_messages). to include("Postal code is invalid.")
      #end
      it "address_idが1では保存ができない" do
        @order.address_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "municipalityが空では保存できない" do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "municipalityが全角文字でないと保存できない" do
        @order.municipality = "kasuyagun"
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
      end
      it "block_numberが空では保存できない" do
        @order.block_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Block number can't be blank")
      end
      it "telが空では保存できない" do
        @order.tel = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end
      it "telが数字以外では保存できない" do
        @order.tel = "abcdefghijk"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
      it "telにハイフンが入っていると保存できない" do
        @order.tel = "123-4567-8910"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
      it "telが9桁以下では保存できない" do
        @order.tel = "123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
      it "telが12桁以上では保存できない" do
        @order.tel = "123456789100"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid")
      end
    end
  end
end