class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :post_code, :sender_id, :municipality, :address, :building, :phone_number

  validates :sender_id, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :post_code,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid." }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_code: post_code, sender_id: sender_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end

