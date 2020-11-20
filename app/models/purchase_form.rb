class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :house_number, :phone_number, :building_name, :area_id, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'Input only number' }
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, phone_number: phone_number, building_name: building_name, area_id: area_id, purchase_id: purchase.id)
  end
end
