class Item < ApplicationRecord
  validates :title,              presence: true
  validates :price,              presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :status_id,          presence: true
  validates :area_id,            presence: true
  validates :delivery_free_id,   presence: true
  validates :guideline_id,       presence: true

  belongs_to :user
end
