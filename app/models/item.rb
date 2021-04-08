class Item < ApplicationRecord
  belongs_to :user
  has_one :order_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :address
  belongs_to :shipping_day

  with_options presence: true do
    validates :item_name
    validates :text
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :address_id
    validates :shipping_day_id
  end
  validates :price, presence: true, format: { with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
