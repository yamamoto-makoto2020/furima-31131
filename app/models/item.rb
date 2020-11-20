class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
  end

  VALID_PRICEL_HALF = /\A[0-9]+\z/.freeze
  with_options presence: true, format: { with: VALID_PRICEL_HALF }, numericality: { only_integer: true, greater_than: 300, less_than: 10_000_000 } do
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :area_id
    validates :delivery_free_id
    validates :guideline_id
  end

  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_free
  belongs_to_active_hash :guideline
  belongs_to_active_hash :status
end
