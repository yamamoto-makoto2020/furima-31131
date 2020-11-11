require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿機能' do
    context '商品の投稿ができる時' do
      it 'title,image,price,explanation,area_id,category_id,delivery_free_id,guideline_id,status_idがある時登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿ができない時' do
      it 'titleが空のとき' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'image画像がないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下のとき' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが9,999,999以上のとき' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが半角数字以外だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'explanationが空のとき' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'area_idが１のとき' do
        @item.area_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end
      it 'category_idが１のとき' do
        @item.category_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'delivery_free_idが１のとき' do
        @item.delivery_free_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery free is not a number')
      end
      it 'guideline_idが１のとき' do
        @item.guideline_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include('Guideline is not a number')
      end
      it 'status_idが１のとき' do
        @item.status_id = [1]
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it 'user_idが紐ついてないとき' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
