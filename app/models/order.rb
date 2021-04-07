class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :address_id, :municipality, :block_number, :building_name, :tel, :user_id, :item_id, :order_history_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
    validates :block_number
    validates :tel, format: { with: /\A\d{10,11}\z/ }
  end
  validates :address_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order_history = OrderHistory.create(user_id: user_id, item_id: item_id)
    BuyerInformation.create(postal_code: postal_code, address_id: address_id, municipality: municipality, block_number: block_number, building_name: building_name, tel: tel, order_history_id: order_history.id)
  end
end