class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
  end

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  with_options presence: true, format: { with: VALID_PRICEL_HALF }, numericality: { only_integer: true, greater_than: 300, less_than: 10000000} do
    validates :price
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :area_id
    validates :delivery_free_id
    validates :guideline_id
  end

  def was_attached?
    self.image.attached?
  end

  has_one_attached :image
  validates :image, presence: true
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area, :category, :delivery_free, :guideline, :status
end
