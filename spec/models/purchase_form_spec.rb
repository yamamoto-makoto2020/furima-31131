require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入者登録機能' do
    context '商品の購入者が登録できる時' do
      it 'item_id,user_idがある時購入できる' do
        expect(@purchase).to be_valid
      end
    end

    context '商品購入者が登録できない時' do
      it 'user_idが紐付いていないとき' do
        @purchase.user = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('User must exist')
      end
      it 'item_idが紐付いていないとき' do
        @purchase.item = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Item must exist')
      end
    end
  end
  describe '商品購入機能' do
    context '商品の購入ができる時' do
      it 'postal_code,city,house_number,area_id,phone_number,purchase_id,tokenがある時購入できる' do
        expect(@purchase_form).to be_valid
      end
      it 'building_nameがなくても登録できる' do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postal_codeが空のとき' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeで(-)がないとき' do
        @purchase_form.postal_code = 1_234_567
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'cityが空のとき' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空のとき' do
        @purchase_form.house_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'area_idが１のとき' do
        @purchase_form.area_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Area must be other than 1')
      end
      it 'phone_numberが空のとき' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10字以下のとき登録できない' do
        @purchase_form.phone_number = 880123456
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12字以上のとき登録できない' do
        @purchase_form.phone_number = '888888888888'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberに(-)があると登録できない' do
        @purchase_form.phone_number = '990-0000-0000'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenが空だと登録できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
