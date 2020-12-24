require 'rails_helper'

RSpec.describe OrderCash, type: :model do
  describe '購入情報の保存' do
     
    before do
      @order = FactoryBot.build(:order_cash)
    end
    context '購入できるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@order).to be_valid
      end
      it '建物名が空白でも商品の購入ができること' do
        @order.build_name = nil
        expect(@order).to be_valid
      end
    end
    context '購入できないとき' do
      it '郵便番号が空であるときは保存できない' do
        @order.post_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank","Post number code Input correctly")
      end
      it '郵便番号にハイフンがないときは保存できない' do
        @order.post_number = '9060008'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number code Input correctly")
      end
      it '都道府県が空であるときは保存できない' do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Area Select")
      end
      it '市区町村が空であるときは保存できない' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空であるときは保存できない' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空であるときは保存できない' do
        @order.telephone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number number Input only number")
      end
      it '電話番号にハイフンがあるときは保存できない' do
        @order.telephone_number = "080-6485-5510"
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number number Input only number")
      end
      it '電話番号が12桁以上であるときは保存できない' do
        @order.telephone_number = "0806485551000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number number Input only number")
      end
      it '電話番号に数字以外があるときは保存できない' do
        @order.telephone_number = "090-abcd-6485"
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number number Input only number")
      end
      it 'tokenが空であるときは保存できない' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
