class Purchase < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :item
end
